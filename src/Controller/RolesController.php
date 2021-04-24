<?php
namespace App\Controller;
use App\Controller\AppController;

class RolesController extends AppController
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
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			$request_body = $this->request->input('json_decode');
			$data = (array)$request_body;
			$condition = [];
			if (!empty($data)) {
				if (!empty($data['group_id'])) {
					$condition['Roles.group_id'] = $data['group_id'];
				}
				if (!empty($data['keywords'])) {
					$keywords = $data['keywords'];
					$condition['Roles.display ILIKE '] = "%$keywords%";
				}
			}
			$query = $this->Roles->find();
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
					$condition['Roles.id'] = $data['id'];
				}
			}
			$query = $this->Roles->find();
			if (!empty($filter)) {
				$query->innerJoinWith('Groups', function($qroup) use ($filter) {
						return $qroup
							->where([
								'Groups.website_id' => $filter['website_id'],
							]);
					});
			}
			$query
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
					return $this->addRole($data);
				} else {
					$http_code = 403;
					$message = 'Unauthorized';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				return $this->addRole($data);
			}
		}
	}

	public function addRole($data = null)
	{
		$role = $this->Roles->newEntity();
		$entity = $this->Roles->patchEntity($role, $data);
		if ($this->Roles->save($entity)) {
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
			$role = $this->Roles->get($request_body->id);
			$data = (array)$request_body;
			if (!empty($filter)) {
				$requester_web = $this->Response->getFilterByWebsite($role->group_id);
				if ($this->Response->validateTheSameValue($filter['website_id'], $requester_web['website_id'])) {
					return $this->editRole($role, $data);
				} else {
					$http_code = 403;
					$message = 'Unauthorized';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				return $this->editRole($role, $data);
			}
		}
	}

	public function editRole($role = null, $data = null)
	{
		$entity = $this->Roles->patchEntity($role, $data);
		if ($this->Roles->save($entity)) {
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
			$role = $this->Roles->get($request_body->id);
			$auth = $this->Auth->user();
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			if (!empty($filter)) {
				$requester_web = $this->Response->getFilterByWebsite($role->group_id);
				if ($this->Response->validateTheSameValue($filter['website_id'], $requester_web['website_id'])) {
					return $this->deleteRole($role);
				} else {
					$http_code = 400;
					$message = 'Delete not success';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				return $this->deleteRole($role);
			}
		}
	}
	
	public function deleteRole($role = null)
	{
		if ($this->Roles->delete($role)) {
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
