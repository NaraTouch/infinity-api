<?php
namespace App\Controller;
use App\Controller\AppController;

class GGMainSlidersController extends AppController
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
					$condition['GGMainSliders.website_id '] = $website_id;
				}
			}
			if (!empty($filter)) {
				$condition = $filter;
			}
			if (!empty($data)) {
				if (!empty($data['keywords'])) {
					$keywords = $data['keywords'];
					$condition['GGMainSliders.display ILIKE '] = "%$keywords%";
				}
			}
			$query = $this->GGMainSliders->find()
						->contain(['Websites'])
						->where($condition);
			$response = [];
			if ($query) {
				$response = $query->toArray();
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
					$condition['GGMainSliders.id'] = $data['id'];
				}
			}
			if (!empty($filter)) {
				$condition['GGMainSliders.website_id'] = $filter['website_id'];
			}
			$query = $this->GGMainSliders->find()
						->where($condition)
						->first();
			if ($query) {
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message, $query);
			} else {
				$http_code = 404;
				$message = 'GGMainSliders not found.';
				return $this->Response->Response($http_code, $message, null, null);
			}
			
		}
	}

	public function add()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			$entity = $this->GGMainSliders->newEntity();
			$request_body = $this->request->input('json_decode');
			$data = (array)$request_body;
			if (!empty($filter)) {
				$data['website_id'] = $filter['website_id'];
			}
			$patchEntity = $this->GGMainSliders->patchEntity($entity, $data);
			if ($this->GGMainSliders->save($patchEntity)) {
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
			$request_body = $this->request->input('json_decode');
			$entity = $this->GGMainSliders->get($request_body->id);
			$data = (array)$request_body;
			if (!empty($filter)) {
				$data['website_id'] = $filter['website_id'];
			}
			$patchEntity = $this->GGMainSliders->patchEntity($entity, $data);
			if ($this->GGMainSliders->save($patchEntity)) {
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
			$entity = $this->GGMainSliders->get($request_body->id);
			$auth = $this->Auth->user();
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			if (!empty($filter)) {
				$validate = $this->Response->validateTheSameValue($filter['website_id'], $entity->website_id);
				if ($validate) {
					return $this->deleteWebsite($entity);
				} else {
					$http_code = 400;
					$message = 'Delete not success';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				return $this->deleteWebsite($entity);
			}
		}
	}
	
	public function deleteWebsite($entity = null)
	{
		if ($this->GGMainSliders->delete($entity)) {
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