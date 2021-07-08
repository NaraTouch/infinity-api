<?php
namespace App\Controller;
use App\Controller\AppController;

class LocalFileManagersController extends AppController
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
					$condition['LocalFileManagers.group_id'] = $data['group_id'];
				}
				if (!empty($data['keywords'])) {
					$keywords = $data['keywords'];
					$condition['LocalFileManagers.web_url ILIKE '] = "%$keywords%";
				}
			}
			$query = $this->LocalFileManagers->find();
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
			$response = [];
			if ($query) {
				$response = $query;
			}
			$http_code = 200;
			$message = 'Success';
			return $this->Response->Response($http_code, $message, $response);
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
					$condition['LocalFileManagers.id'] = $data['id'];
				}
			}
			$query = $this->LocalFileManagers->find();
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
		$local_file = $this->LocalFileManagers->newEntity();
		$entity = $this->LocalFileManagers->patchEntity($local_file, $data);
		if ($this->LocalFileManagers->save($entity)) {
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
			$local_file = $this->LocalFileManagers->get($request_body->id);
			$data = (array)$request_body;
			if (!empty($filter)) {
				$requester_web = $this->Response->getFilterByWebsite($local_file->group_id);
				if ($this->Response->validateTheSameValue($filter['website_id'], $requester_web['website_id'])) {
					return $this->editRole($local_file, $data);
				} else {
					$http_code = 403;
					$message = 'Unauthorized';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				return $this->editRole($local_file, $data);
			}
		}
	}

	public function editRole($local_file = null, $data = null)
	{
		$entity = $this->LocalFileManagers->patchEntity($local_file, $data);
		if ($this->LocalFileManagers->save($entity)) {
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
			$local_file = $this->LocalFileManagers->get($request_body->id);
			$auth = $this->Auth->user();
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			if (!empty($filter)) {
				$requester_web = $this->Response->getFilterByWebsite($local_file->group_id);
				if ($this->Response->validateTheSameValue($filter['website_id'], $requester_web['website_id'])) {
					return $this->deleteRole($local_file);
				} else {
					$http_code = 400;
					$message = 'Delete not success';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				return $this->deleteRole($local_file);
			}
		}
	}
	
	public function deleteRole($local_file = null)
	{
		if ($this->LocalFileManagers->delete($local_file)) {
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
