<?php
namespace App\Controller;
use App\Controller\AppController;

class GroupsController extends AppController
{

	public function initialize()
	{
		parent::initialize();
		$this->loadComponent('Response');
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
				if (!empty($data['website_id'])) {
					$website_id = $data['website_id'];
					$condition['Groups.website_id '] = $website_id;
				}
			}
			if (!empty($filter)) {
				$condition = $filter;
			}
			if (!empty($data)) {
				if (!empty($data['keywords'])) {
					$keywords = $data['keywords'];
					$condition['Groups.display ILIKE '] = "%$keywords%";
				}
			}
			$query = $this->Groups->find()
						->contain(['Websites'])
						->where($condition);
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
					$condition['Groups.id'] = $data['id'];
				}
			}
			if (!empty($filter)) {
				$condition['Groups.website_id'] = $filter['website_id'];
			}
			$query = $this->Groups->find()
						->where($condition)
						->first();
			if ($query) {
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message, $query);
			} else {
				$http_code = 404;
				$message = 'Groups not found.';
				return $this->Response->Response($http_code, $message, null, null);
			}
			
		}
	}

	public function add()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			$super_user = $this->Response->checkSuperUser($auth['group_id']);
			$group = $this->Groups->newEntity();
			$request_body = $this->request->input('json_decode');
			$data = (array)$request_body;
			if (!empty($filter)) {
				$data['website_id'] = $filter['website_id'];
			}
			if (!empty($super_user)) {
				$data['super_user'] = $super_user['super_user'];
			}
			$entity = $this->Groups->patchEntity($group, $data);
			if ($this->Groups->save($entity)) {
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
			$auth = $this->Auth->user();
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			$super_user = $this->Response->checkSuperUser($auth['group_id']);
			$request_body = $this->request->input('json_decode');
			$group = $this->Groups->get($request_body->id);
			$data = (array)$request_body;
			if (!empty($filter)) {
				$data['website_id'] = $filter['website_id'];
			}
			if (!empty($super_user)) {
				$data['super_user'] = $super_user['super_user'];
			}
			$entity = $this->Groups->patchEntity($group, $data);
			if ($this->Groups->save($entity)) {
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
			$group = $this->Groups->get($request_body->id);
			$auth = $this->Auth->user();
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			if (!empty($filter)) {
				$validate = $this->Response->validateTheSameValue($filter['website_id'], $group->website_id);
				if ($validate) {
					return $this->deleteWebsite($group);
				} else {
					$http_code = 400;
					$message = 'Delete not success';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				return $this->deleteWebsite($group);
			}
		}
	}
	
	public function deleteWebsite($group = null)
	{
		if ($this->Groups->delete($group)) {
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
