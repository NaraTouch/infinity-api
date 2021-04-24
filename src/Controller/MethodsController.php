<?php
namespace App\Controller;
use App\Controller\AppController;

class MethodsController extends AppController
{

	public function initialize()
	{
		parent::initialize();
		$this->loadComponent('Response');
	}

	public function index()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			$request_body = $this->request->input('json_decode');
			$data = (array)$request_body;
			$condition = [];
			if (!empty($data)) {
				if (!empty($data['module_id'])) {
					$condition['Methods.module_id'] = $data['module_id'];
				}
				if (!empty($data['keywords'])) {
					$keywords = $data['keywords'];
					$condition['Methods.display ILIKE '] = "%$keywords%";
				}
			}
			$super_user = $this->Response->allowOnlySuperUser($auth['group_id']);
			$query = $this->Methods->find()
						->contain(['Modules'])
						->where($condition);
			if (!$super_user) {
				$role = $this->Response->getFilterRoleByGroup($auth['group_id']);
				if ($role) {
					$query->matching('Permissions', function($permission) use ($role) {
						return $permission->where([
							'Permissions.role_id' => $role['role_id'],
						]);
					})
					->order(['Methods.sort' => 'asc']);
				} else {
					$query = false;
				}
			} else {
				$query->order(['Methods.sort' => 'asc']);
			}
			$data = [];
			if ($query) {
				$data = $query->toArray();
			}
			$http_code = 200;
			$message = 'Success';
			return $this->Response->Response($http_code, $message, $data);
		}
	}

	public function add()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			if ($this->Response->allowOnlySuperUser($auth['group_id'])) {
				$method = $this->Methods->newEntity();
				$request_body = $this->request->input('json_decode');
				$data = (array)$request_body;
				$entity = $this->Methods->patchEntity($method, $data);
				if ($this->Methods->save($entity)) {
					$http_code = 200;
					$message = 'Success';
					return $this->Response->Response($http_code, $message);
				} else {
					$http_code = 400;
					$message = 'Add not success';
					return $this->Response->Response($http_code, $message, null, $entity->errors());
				}
			} else {
				$http_code = 403;
				$message = 'Unauthorized';
				return $this->Response->Response($http_code, $message, null, null);
			}
			
		}
	}

	public function view()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			if ($this->Response->allowOnlySuperUser($auth['group_id'])) {
				$request_body = $this->request->input('json_decode');
				$method = $this->Methods->get($request_body->id);
				if ($method) {
					$http_code = 200;
					$message = 'Success';
					return $this->Response->Response($http_code, $message, $method);
				} else {
					$http_code = 404;
					$message = 'User not found.';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				$http_code = 403;
				$message = 'Unauthorized';
				return $this->Response->Response($http_code, $message, null, null);
			}
		}
		
	}

	public function edit()
	{
		if ($this->request->is(['patch', 'post', 'put'])) {
			$auth = $this->Auth->user();
			if ($this->Response->allowOnlySuperUser($auth['group_id'])) {
				$request_body = $this->request->input('json_decode');
				$method = $this->Methods->get($request_body->id);
				$data = (array)$request_body;
				$entity = $this->Methods->patchEntity($method, $data);
				if ($this->Methods->save($entity)) {
					$http_code = 200;
					$message = 'Success';
					return $this->Response->Response($http_code, $message);
				} else {
					$http_code = 400;
					$message = 'Edit not success';
					return $this->Response->Response($http_code, $message, null, $entity->errors());
				}
			} else {
				$http_code = 403;
				$message = 'Unauthorized';
				return $this->Response->Response($http_code, $message, null, null);
			}
		}
	}

	public function delete()
	{
		if ($this->request->is(['patch', 'post', 'put'])) {
			$auth = $this->Auth->user();
			if ($this->Response->allowOnlySuperUser($auth['group_id'])) {
				$request_body = $this->request->input('json_decode');
				$method = $this->Methods->get($request_body->id);
				if ($this->Methods->delete($method)) {
					$http_code = 200;
					$message = 'Success';
					return $this->Response->Response($http_code, $message);
				} else {
					$http_code = 400;
					$message = 'Delete not success';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				$http_code = 403;
				$message = 'Unauthorized';
				return $this->Response->Response($http_code, $message, null, null);
			}
		}
	}
}
