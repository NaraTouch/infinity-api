<?php
namespace App\Controller;
use Cake\Controller\Controller;

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
					'queryDatasource' => true
				]
			],
			'authError' => ['controller' => 'Error', 'action' => 'Message', 402],
			'unauthorizedRedirect' => ['controller' => 'Error', 'action' => 'Message', 402],
			'checkAuthIn' => 'Controller.initialize'
		]);
	}
}
