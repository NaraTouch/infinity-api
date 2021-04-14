<?php
namespace App\Controller;
use App\Controller\AppController;

class PermissionsController extends AppController
{

	public function initialize()
	{
		parent::initialize();
		$this->loadComponent('Response');
	}

	public function getPermissionByRole()
	{
		if ($this->request->is('post')) {
			$request_body = $this->request->input('json_decode');
			$conditions = [
				'role_id' => $request_body->role_id,
			];
			$query = $this->getPermission($conditions);
			$data = [];
			if (isset($query)) {
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
			$request_body = $this->request->input('json_decode');
			$data = (array)$request_body;
			$permission_data = [];
			$role_id = $data['role_id'];
			foreach ($data['permissions'] as $key => $value) {
				$permission_data[] = [
					'role_id' => $value->role_id,
					'method_id' => $value->method_id,
					'module_id' => $value->module_id,
				];
			}
			$conditions = ['role_id' => $role_id];
			$query = $this->getPermission($conditions);
			if (!empty($query)) {
				if ($this->deletAllPermissionsByRole($conditions)) {
					return $this->addPermission($permission_data);
				} else {
					$http_code = 400;
					$message = 'Permission Error.';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				return $this->addPermission($permission_data);
			}
		}
	}

	public function addPermission($permission_data = null)
	{
		$this->autoRender = false;
		$permissions = $this->Permissions->newEntity();
		$entities = $this->Permissions->patchEntities($permissions, $permission_data);
		if ($this->Permissions->saveMany($entities)) {
			$http_code = 200;
			$message = 'Success';
			return $this->Response->Response($http_code, $message);
		} else {
			$http_code = 400;
			$message = 'Permission remove!!!';
			return $this->Response->Response($http_code, $message, null, null);
		}
	}

	public function getPermission($conditions)
	{
		$query = $this->Permissions->find()
				->where($conditions);
		if ($query) {
			return $query->toArray();
		}
		return false;
	}

	public function deletAllPermissionsByRole($conditions = [])
	{
		if ($this->Permissions->deleteAll($conditions)) {
			return true;
		}
		return false;
	}

}
