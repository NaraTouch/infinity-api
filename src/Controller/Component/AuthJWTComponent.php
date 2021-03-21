<?php
namespace App\Controller\Component;
use Cake\Controller\Component;
use Cake\ORM\TableRegistry;
use Cake\Utility\Security;
use Firebase\JWT\JWT;

class AuthJWTComponent extends Component
{

	private $Tokens;
	public function initialize(array $config)
	{
		parent::initialize($config);
		$this->Tokens = TableRegistry::get('Tokens');
	}

	public function generateToken($user = null)
	{
		$data = [
			'email' => $user['email'],
			'Auth' => 'Bearer',
			'token' => JWT::encode([
				'sub' => $user['id'],
				'exp' =>  time() + 86400, // 1 day
				'role' => $user['group']['name']
			],
			Security::salt())
		];
		$token = $data['token'];
		$save_token = $this->Tokens->saveToken($user['id'], $token);
		if ($save_token) {
			return $data;
		}
		return false;
	}

}