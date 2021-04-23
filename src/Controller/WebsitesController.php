<?php
namespace App\Controller;
use App\Controller\AppController;

class WebsitesController extends AppController
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
			if (!empty($filter)) {
				$condition['Websites.id'] = $filter['website_id'];
			}
			if (!empty($data)) {
				if (!empty($data['keywords'])) {
					$keywords = $data['keywords'];
					$condition['Websites.display ILIKE '] = "%$keywords%";
				}
			}
			$query = $this->Websites->find()
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

	public function add()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			if ($this->Response->allowOnlySuperUser($auth['group_id'])) {
				$website = $this->Websites->newEntity();
				$request_body = $this->request->input('json_decode');
				$data = (array)$request_body;
				$entity = $this->Websites->patchEntity($website, $data);
				if ($this->Websites->save($entity)) {
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
			$request_body = $this->request->input('json_decode');
			$id = $request_body->id;
			$auth = $this->Auth->user();
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			if (!empty($filter)) {
				$id = $filter['website_id'];
			}
			$website = $this->Websites->get($id);
			if ($website) {
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message, $website);
			} else {
				$http_code = 404;
				$message = 'Website not found.';
				return $this->Response->Response($http_code, $message, null, null);
			}
			
		}
		
	}

	public function edit()
	{
		if ($this->request->is(['patch', 'post', 'put'])) {
			$auth = $this->Auth->user();
			$request_body = $this->request->input('json_decode');
			$id = $request_body->id;
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			if (!empty($filter)) {
				$id = $filter['website_id'];
			}
			$website = $this->Websites->get($id);
			$data = (array)$request_body;
			$entity = $this->Websites->patchEntity($website, $data);
			if ($this->Websites->save($entity)) {
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
			$auth = $this->Auth->user();
			if ($this->Response->allowOnlySuperUser($auth['group_id'])) {
				$request_body = $this->request->input('json_decode');
				$website = $this->Websites->get($request_body->id);
				if ($this->Websites->delete($website)) {
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
