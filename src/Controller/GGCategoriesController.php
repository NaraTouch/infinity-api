<?php
namespace App\Controller;
use App\Controller\AppController;

class GGCategoriesController extends AppController
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
					$condition['GGCategories.website_id '] = $website_id;
				}
			}
			if (!empty($filter)) {
				$condition = $filter;
			}
			if (!empty($data)) {
				if (!empty($data['keywords'])) {
					$keywords = $data['keywords'];
					$condition['GGCategories.title ILIKE '] = "%$keywords%";
				}
			}
			$query = $this->GGCategories->find()
						->contain(['Websites'])
						->where($condition)
						->order(['sort' => 'ASC']);
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
					$condition['GGCategories.id'] = $data['id'];
				}
			}
			if (!empty($filter)) {
				$condition['GGCategories.website_id'] = $filter['website_id'];
			}
			$query = $this->GGCategories->find()
						->where($condition)
						->first();
			if ($query) {
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message, $query);
			} else {
				$http_code = 404;
				$message = 'GGCategories not found.';
				return $this->Response->Response($http_code, $message, null, null);
			}
			
		}
	}

	public function add()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			$entity = $this->GGCategories->newEntity();
			$request_body = $this->request->input('json_decode');
			$data = (array)$request_body;
			if (!empty($filter)) {
				$data['website_id'] = $filter['website_id'];
			}
			$patchEntity = $this->GGCategories->patchEntity($entity, $data);
			if ($this->GGCategories->save($patchEntity)) {
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
			$entity = $this->GGCategories->get($request_body->id);
			$data = (array)$request_body;
			if (!empty($filter)) {
				$data['website_id'] = $filter['website_id'];
			}
			$patchEntity = $this->GGCategories->patchEntity($entity, $data);
			if ($this->GGCategories->save($patchEntity)) {
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
			$entity = $this->GGCategories->get($request_body->id);
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
		if ($this->GGCategories->delete($entity)) {
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
