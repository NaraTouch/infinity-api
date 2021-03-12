<?php
namespace App\Controller;
use Cake\Controller\Controller;
use Cake\Event\Event;

class AppController extends Controller
{

	public function initialize()
	{
		parent::initialize();
		$this->loadModel('Tokens');
		$this->loadComponent('RequestHandler');
		$this->loadComponent('Auth', [
			'storage' => 'Memory',
			'authenticate' => [
				'Form' => [
					'scope' => ['Users.active' => 1],
					'fields' => [
						'username' => 'email',
						'password' => 'password',
					],
					'contain' => ['Groups']
				],
				'ADmad/JwtAuth.Jwt' => [
					'parameter' => 'token',
					'userModel' => 'Users',
					'scope' => ['Users.active' => 1],
					'fields' => [
						'username' => 'id'
					],
					'queryDatasource' => false
				]
			],
			'unauthorizedRedirect' => false,
			'checkAuthIn' => 'Controller.initialize'
		]);
		$this->verifyAccess();
	}

	public function verifyAccess()
	{
		$header = $this->request->getHeaders();
		$controller = strtolower($this->request->getParam('controller'));
		$action = strtolower($this->request->getParam('action'));
		if ($controller !== 'users' || $action !== 'login') {
			if(array_key_exists('Authorization', $header) && !empty($header['Authorization'])) {
				$str_token = explode(" ", $header['Authorization'][0]);
				if (isset($str_token) && $str_token[0] === 'Bearer') {
					$token = $str_token[1];
					$get_token = $this->Tokens->getUserByToken($token);
					if (!$get_token) {
						return $this->redirect(['controller' => 'Error', 'action' => 'Message', 402]);
					}
				} else {
					return $this->redirect(['controller' => 'Error', 'action' => 'Message', 402]);
				}
			} else {
				return $this->redirect(['controller' => 'Error', 'action' => 'Message', 401]);
			}
		}
	}
	
}
