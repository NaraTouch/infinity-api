<?php
namespace App\Controller;
use Cake\Controller\Controller;
use Cake\Event\Event;

class AppController extends Controller
{

	public function initialize()
	{
		parent::initialize();
		$this->loadComponent('Auth', [
			'storage' => 'Memory',
			'authenticate' => [
				'Form' => [
					'scope' => ['Users.active' => 1],
					'fields' => [
						'username' => 'email',
						'password' => 'password',
					],
					'contain' => ['Roles']
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
	}

}
