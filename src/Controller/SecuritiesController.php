<?php
namespace App\Controller;
use App\Controller\AppController;

class SecuritiesController extends AppController
{

	public function initialize()
	{
		parent::initialize();
		$this->loadModel('Modules');
		$this->loadModel('Methods');
		$this->loadModel('Roles');
		$this->loadModel('Tokens');
		$this->loadComponent('Response');
	}

	public function getAccessUrl()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			$header = $this->request->getHeaders();
			$token = str_replace("Bearer ","",$header['Authorization'][0]);
			if ($token && !empty($auth)) {
				$user = $this->Tokens->getUserByTokenOnly($token);
				if ($user->user_id == $auth['id']) {
					$role = $this->Roles->getRoleByGroup($auth['group_id']);
					if ($role) {
						$permission = $this->getMenu($role->id);
						$http_code = 200;
						$message = 'Success';
						return $this->Response->Response($http_code, $message, $permission);
					} else {
						$http_code = 402;
						$message = 'Unauthorized';
						return $this->Response->Response($http_code, $message);
					}
				} else {
					$http_code = 402;
					$message = 'Unauthorized';
					return $this->Response->Response($http_code, $message);
				}
			} else {
				$http_code = 402;
				$message = 'Unauthorized';
				return $this->Response->Response($http_code, $message);
			}
		}
	}

	public function getMenu($role = null)
	{
		$active = 1;
		$query = $this->Modules->find()
				->contain([
					'Methods' => function($method) use($role, $active){
						return $method
						->matching('Permissions', function ($permission) use($role) {
								return $permission
									->where(['Permissions.role_id' => $role]);
						})
						->Order(['Methods.sort']);
					}
				])
				->Order(['Modules.sort'])
				->where(['Modules.active' => $active]);
		if ($query) {
			$query->toArray();
			$menu = [];
			foreach ($query as $key => $value) {
				if (!empty($value->methods)) {
					$menu[] = $value;
				}
			}
			return $menu;
		}
		return false;
	}
}
