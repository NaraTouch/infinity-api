<?php
namespace ADmad\JwtAuth\Auth;

use Cake\Auth\BaseAuthenticate;
use Cake\Controller\ComponentRegistry;
use Cake\Core\Configure;
use Cake\Http\Exception\UnauthorizedException;
use Cake\Http\Response;
use Cake\Http\ServerRequest;
use Cake\Utility\Security;
use Exception;
use Firebase\JWT\JWT;
use Cake\ORM\TableRegistry;

class JwtAuthenticate extends BaseAuthenticate
{
	protected $_token_table;
	protected $_token;
	protected $_payload;
	protected $_error;

	public function __construct(ComponentRegistry $registry, $config)
	{
		$defaultConfig = [
			'header' => 'authorization',
			'prefix' => 'bearer',
			'parameter' => 'token',
			'queryDatasource' => true,
			'fields' => ['username' => 'id'],
			'unauthenticatedException' => UnauthorizedException::class,
			'key' => null,
		];

		if (!class_exists(UnauthorizedException::class)) {
			$defaultConfig['unauthenticatedException'] = 'Cake\Network\Exception\UnauthorizedException';
		}

		$this->setConfig($defaultConfig);

		if (empty($config['allowedAlgs'])) {
			$config['allowedAlgs'] = ['HS256'];
		}

		parent::__construct($registry, $config);
	}

	public function authenticate(ServerRequest $request, Response $response)
	{
		return $this->getUser($request);
	}

	public function getUser(ServerRequest $request)
	{
		$payload = $this->getPayload($request);

		if (empty($payload)) {
			return false;
		}

		if (!$this->_config['queryDatasource']) {
			return json_decode(json_encode($payload), true);
		}

		if (!isset($payload->sub)) {
			return false;
		}

		$user = $this->_findUser($payload->sub);
		if (!$user) {
			return false;
		}

		unset($user[$this->_config['fields']['password']]);

		return $user;
	}

	public function getPayload($request = null)
	{
		if (!$request) {
			return $this->_payload;
		}

		$payload = null;

		$token = $this->getToken($request);
		if ($token) {
			$payload = $this->_decode($token);
		}

		return $this->_payload = $payload;
	}

	public function getToken($request = null)
	{
		$this->_token_table = TableRegistry::get('Tokens');
		$config = $this->_config;
		if ($request === null) {
			return $this->_token;
		}

		$header = $request->getHeaderLine($config['header']);
		if ($header && stripos($header, $config['prefix']) === 0) {
			$this->_token = str_ireplace($config['prefix'] . ' ', '', $header);
			$get_token = $this->_token_table->getUserByToken($this->_token);
			if ($get_token) {
				return $this->_token = str_ireplace($config['prefix'] . ' ', '', $header);
			} else {
				throw new UnauthorizedException('Unauthorized');
			}
		}

		if (!empty($this->_config['parameter'])) {
			$token = $request->getQuery($this->_config['parameter']);
			if ($token !== null) {
				$token = (string)$token;
			}

			return $this->_token = $token;
		}
		return $this->_token;
	}

	protected function _decode($token)
	{
		$config = $this->_config;
		try {
			$payload = JWT::decode(
				$token,
				$config['key'] ?: Security::getSalt(),
				$config['allowedAlgs']
			);

			return $payload;
		} catch (Exception $e) {
			if (Configure::read('debug')) {
				throw $e;
			}
			$this->_error = $e;
		}
	}

	public function unauthenticated(ServerRequest $request, Response $response)
	{
		if (!$this->_config['unauthenticatedException']) {
			return;
		}

		$message = $this->_error
			? $this->_error->getMessage()
			: $this->_registry->get('Auth')->getConfig('authError');

		$exception = new $this->_config['unauthenticatedException']($message);
		throw $exception;
	}
}
