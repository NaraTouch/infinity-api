<?php
namespace App\Controller;
use App\Controller\AppController;
use Cake\Event\EventInterface;

class UsersController extends AppController
{

	public function initialize()
	{
		parent::initialize();
		$this->loadComponent('Response');
		$this->loadComponent('AuthJWT');
		$this->Auth->allow(['login']);
	}
	
	public function getProfile()
	{
		if ($this->request->is('post')) {
			$test = 'jjj';
		}
	}

	public function login()
	{
		if ($this->request->is('post')) {
			$user = $this->Auth->identify();
			if ($user) {
				$http_code = 200;
				$message = 'Success';
				$token = $this->AuthJWT->generateToken($user);
				if ($token) {
					return $this->Response->Response($http_code, $message, $token);
				} else {
					$http_code = 500;
					$message = 'Internal Server Error';
					return $this->Response->Response($http_code, $message);
				}
			} else {
				$http_code = 401;
				$message = 'Invalid email or password';
				return $this->Response->Response($http_code, $message);
			}
		}
	}

	public function index()
	{
		if ($this->request->is('post')) {
			$this->paginate = [
				'contain' => ['Groups'],
			];
			$users = $this->paginate($this->Users);
			$data = [];
			if ($users) {
				$data = $users;
			}
			$http_code = 200;
			$message = 'Success';
			return $this->Response->Response($http_code, $message, $data);
		}
	}

	public function view()
	{
		if ($this->request->is('post')) {
			$request_body = $this->request->input('json_decode');
			$user = $this->Users->get($request_body->id, [
				'contain' => ['Groups'],
			]);
			if ($user) {
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message, $user);
			} else {
				$http_code = 404;
				$message = 'User not found.';
				return $this->Response->Response($http_code, $message, null, null);
			}
			
		}
		
	}

	public function add()
	{
		if ($this->request->is('post')) {
			$user = $this->Users->newEntity();
			$request_body = $this->request->input('json_decode');
			$data = (array)$request_body;
			$entity = $this->Users->patchEntity($user, $data);
			if ($this->Users->save($entity)) {
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message);
			} else {
				$http_code = 400;
				$message = 'Add not success';
				return $this->Response->Response($http_code, $message, null, $entity->errors());
			}
		}
	}

	public function edit()
	{
		if ($this->request->is(['patch', 'post', 'put'])) {
			$request_body = $this->request->input('json_decode');
			$user = $this->Users->get($request_body->id);
			$data = (array)$request_body;
			if (empty($data['password'])) {
				$data['password'] = $user->password;
			}
			$entity = $this->Users->patchEntity($user, $data);
			if ($this->Users->save($entity)) {
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message);
			} else {
				$http_code = 400;
				$message = 'Edit not success';
				return $this->Response->Response($http_code, $message, null, $entity->errors());
			}
		}
	}

	public function delete()
	{
		if ($this->request->is(['patch', 'post', 'put'])) {
			$request_body = $this->request->input('json_decode');
			$user = $this->Users->get($request_body->id);
			if ($this->Users->delete($user)) {
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message);
			} else {
				$http_code = 400;
				$message = 'Delete not success';
				return $this->Response->Response($http_code, $message, null, null);
			}
		}
	}
}
