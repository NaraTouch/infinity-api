<?php
namespace App\Controller;
use App\Controller\AppController;

class UsersController extends AppController
{

	public function initialize()
	{
		parent::initialize();
		$this->loadComponent('Response');
		$this->loadComponent('AuthJWT');
		$this->Auth->allow(['login']);
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
				$http_code = 403;
				$message = 'Invalid email or password';
				return $this->Response->Response($http_code, $message);
			}
		}
	}

	public function index()
	{
		if ($this->request->is('post')) {
			$condition = [];
			$auth = $this->Auth->user();
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			$request_body = $this->request->input('json_decode');
			$data = (array)$request_body;
			if (!empty($data)) {
				if (!empty($data['group_id'])) {
					$condition['Users.group_id'] = $data['group_id'];
				}
				if (!empty($data['keywords'])) {
					$keywords = $data['keywords'];
					$condition['Users.name ILIKE '] = "%$keywords%";
				}
			}
			$query = $this->Users->find();
			if (!empty($filter)) {
					$query->innerJoinWith('Groups', function($qroup) use ($filter) {
						return $qroup
							->where([
								'Groups.website_id' => $filter['website_id'],
							]);
					})
					->contain(['Groups'])
					->where($condition);
			} else {
				$query
					->contain(['Groups'])
					->where($condition);
			}
			$data = [];
			if ($query) {
				$data = $query;
			}
			$http_code = 200;
			$message = 'Success';
			return $this->Response->Response($http_code, $message, $data);
		}
	}

	public function view()
	{
		if ($this->request->is('post')) {
			$condition = [];
			$auth = $this->Auth->user();
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			$request_body = $this->request->input('json_decode');
			$data = (array)$request_body;
			if (!empty($data)) {
				if (!empty($data['id'])) {
					$condition['Users.id'] = $data['id'];
				}
			}
			$query = $this->Users->find();
			if (!empty($filter)) {
				$query->innerJoinWith('Groups', function($qroup) use ($filter) {
					return $qroup
						->where([
							'Groups.website_id' => $filter['website_id'],
						]);
				});
			}
			$query
				->contain(['Groups'])
				->where($condition)
				->first();
			if ($query) {
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message, $query);
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
			$auth = $this->Auth->user();
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			$request_body = $this->request->input('json_decode');
			$data = (array)$request_body;
			if (!empty($filter)) {
				$requester_web = $this->Response->getFilterByWebsite($data['group_id']);
				if ($this->Response->validateTheSameValue($filter['website_id'], $requester_web['website_id'])) {
					return $this->addUser($data);
				} else {
					$http_code = 403;
					$message = 'Unauthorized';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				return $this->addUser($data);
			}
		}
	}
	public function addUser($data = null)
	{
		$user = $this->Users->newEntity();
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

	public function edit()
	{
		if ($this->request->is(['patch', 'post', 'put'])) {
			$auth = $this->Auth->user();
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			$request_body = $this->request->input('json_decode');
			$user = $this->Users->get($request_body->id);
			$data = (array)$request_body;
			if (empty($data['password'])) {
				$data['password'] = $user->password;
			}
			if (!empty($filter)) {
				$requester_web = $this->Response->getFilterByWebsite($user->group_id);
				if ($this->Response->validateTheSameValue($filter['website_id'], $requester_web['website_id'])) {
					return $this->editUser($user, $data);
				} else {
					$http_code = 403;
					$message = 'Unauthorized';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				return $this->editUser($user, $data);
			}
		}
	}

	public function editUser($user = null, $data = null)
	{
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

	public function delete()
	{
		if ($this->request->is(['patch', 'post', 'put'])) {
			$request_body = $this->request->input('json_decode');
			$user = $this->Users->get($request_body->id);
			$auth = $this->Auth->user();
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			if (!empty($filter)) {
				$requester_web = $this->Response->getFilterByWebsite($user->group_id);
				if ($this->Response->validateTheSameValue($filter['website_id'], $requester_web['website_id'])) {
					return $this->deleteUser($user);
				} else {
					$http_code = 400;
					$message = 'Delete not success';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				return $this->deleteUser($user);
			}
		}
	}
	
	public function deleteUser($user = null)
	{
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
