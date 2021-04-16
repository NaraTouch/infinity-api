<?php
namespace App\Controller;
use App\Controller\AppController;

class ModulesController extends AppController
{

	public function initialize()
	{
		parent::initialize();
		$this->loadComponent('Response');
	}

	public function lists()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			$query = $this->Modules->find();
			$super_user = $this->Response->allowOnlySuperUser($auth['group_id']);
			if (!$super_user) {
				$role = $this->Response->getFilterRoleByGroup($auth['group_id']);
				if ($role) {
					$query->innerJoinWith('Permissions', function($permission) use ($role) {
						return $permission
							->where([
								'Permissions.role_id' => $role['role_id'],
							]);
					})
					->contain('Methods', function ($method) use ($role) {
						return $method->innerJoinWith('Permissions', function($method_permission) use ($role) {
							return $method_permission
								->where([
									'Permissions.role_id' => $role['role_id'],
								]);
						});
					})
					->group(['Modules.id'])
					->order(['Modules.sort' => 'asc']);
				} else {
					$query = false;
				}
			} else {
				$query
					->contain(['Methods'])
					->order(['Modules.sort' => 'asc']);
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

	public function index()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			$request_body = $this->request->input('json_decode');
			$data = (array)$request_body;
			$condition = [];
			if (!empty($data)) {
				if (!empty($data['keywords'])) {
					$keywords = $data['keywords'];
					$condition['Modules.name ILIKE '] = "%$keywords%";
				}
			}
			$query = $this->Modules->find();
			$super_user = $this->Response->allowOnlySuperUser($auth['group_id']);
			if (!$super_user) {
				$role = $this->Response->getFilterRoleByGroup($auth['group_id']);
				if ($role) {
					$query->innerJoinWith('Permissions', function($permission) use ($role) {
						return $permission
							->where([
								'Permissions.role_id' => $role['role_id'],
							]);
					})
					->contain('Methods', function ($method) use ($role) {
						return $method->innerJoinWith('Permissions', function($method_permission) use ($role) {
							return $method_permission
								->where([
									'Permissions.role_id' => $role['role_id'],
								]);
						});
					})
					->where($condition)
					->group(['Modules.id'])
					->order(['Modules.sort' => 'asc']);
				} else {
					$query = false;
				}
			} else {
				$query
					->contain(['Methods'])
					->where($condition)
					->order(['Modules.sort' => 'asc']);
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

	public function add()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			if ($this->Response->allowOnlySuperUser($auth['group_id'])) {
				$module = $this->Modules->newEntity();
				$request_body = $this->request->input('json_decode');
				$data = (array)$request_body;
				$entity = $this->Modules->patchEntity($module, $data);
				if ($this->Modules->save($entity)) {
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
				return $this->Response->Response($http_code, $message, null, $entity->errors());
			}
			
		}
	}

	public function view()
	{
		if ($this->request->is('post')) {
			$request_body = $this->request->input('json_decode');
			$module = $this->Modules->get($request_body->id);
			if ($module) {
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message, $module);
			} else {
				$http_code = 404;
				$message = 'User not found.';
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
				$module = $this->Modules->get($request_body->id);
				$data = (array)$request_body;
				$entity = $this->Modules->patchEntity($module, $data);
				if ($this->Modules->save($entity)) {
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
				return $this->Response->Response($http_code, $message, null, $entity->errors());
			}
		}
	}

	public function delete()
	{
		if ($this->request->is(['patch', 'post', 'put'])) {
			$auth = $this->Auth->user();
			if ($this->Response->allowOnlySuperUser($auth['group_id'])) {
				$request_body = $this->request->input('json_decode');
				$module = $this->Modules->get($request_body->id);
				if ($this->Modules->delete($module)) {
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
				return $this->Response->Response($http_code, $message, null, $entity->errors());
			}
		}
	}
}
