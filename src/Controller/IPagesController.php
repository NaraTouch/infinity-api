<?php
namespace App\Controller;
use App\Controller\AppController;

class IPagesController extends AppController
{

	public function initialize()
	{
		parent::initialize();
		$this->loadModel('Pages');
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
			if (!empty($filter)) {
				$condition['Pages.website_id'] = $filter['website_id'];
			}
			if (!empty($data)) {
				if (!empty($data['keywords'])) {
					$keywords = $data['keywords'];
					$condition['Pages.name ILIKE '] = "%$keywords%";
				}
				if (!empty($data['website_id'])) {
					$website_id = $data['website_id'];
					$condition['Pages.website_id '] = $website_id;
				}
			}
			$query = $this->Pages->find()
					->contain([
						'Subpages',
						'Websites'
					])
					->where($condition);
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
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			$request_body = $this->request->input('json_decode');
			$data = (array)$request_body;
			if (!empty($filter)) {
				if ($this->Response->validateTheSameValue($filter['website_id'], $data['website_id'])) {
					return $this->addPage($data);
				} else {
					$http_code = 403;
					$message = 'Unauthorized';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				return $this->addPage($data);
			}
		}
	}

	public function addPage($data = null)
	{
		$entity = $this->Pages->newEntity();
		$patchEntity = $this->Pages->patchEntity($entity, $data);
		if ($this->Pages->save($patchEntity)) {
			$http_code = 200;
			$message = 'Success';
			return $this->Response->Response($http_code, $message);
		} else {
			$http_code = 400;
			$message = 'Add not success';
			return $this->Response->Response($http_code, $message, null, $patchEntity->errors());
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
			if (!empty($filter)) {
				$condition['Pages.website_id'] = $filter['website_id'];
			}
			if (!empty($data)) {
				if (!empty($data['id'])) {
					$id = $data['id'];
					$condition['Pages.id '] = $id;
				}
			}
			$query = $this->Pages->find()
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

	public function edit()
	{
		if ($this->request->is(['patch', 'post', 'put'])) {
			$auth = $this->Auth->user();
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			$request_body = $this->request->input('json_decode');
			$query = $this->Pages->get($request_body->id);
			$data = (array)$request_body;
			if (!empty($filter)) {
				if ($this->Response->validateTheSameValue($filter['website_id'], $data['website_id'])) {
					return $this->editPage($data, $query);
				} else {
					$http_code = 403;
					$message = 'Unauthorized';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				return $this->editPage($data, $query);
			}
		}
	}

	public function editPage($data = null, $query = null)
	{
		$patchEntity = $this->Pages->patchEntity($query, $data);
		if ($this->Pages->save($patchEntity)) {
			$http_code = 200;
			$message = 'Success';
			return $this->Response->Response($http_code, $message);
		} else {
			$http_code = 400;
			$message = 'Edit not success';
			return $this->Response->Response($http_code, $message, null, $patchEntity->errors());
		}
	}

	public function delete()
	{
		if ($this->request->is(['patch', 'post', 'put'])) {
			$auth = $this->Auth->user();
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			$request_body = $this->request->input('json_decode');
			$query = $this->Pages->get($request_body->id);
			if (!empty($filter)) {
				if ($this->Response->validateTheSameValue($filter['website_id'], $query->website_id)) {
					return $this->deletePage($query);
				} else {
					$http_code = 403;
					$message = 'Unauthorized';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				return $this->deletePage($query);
			}
		}
	}
	
	public function deletePage($query = null)
	{
		if ($this->Pages->delete($query)) {
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
