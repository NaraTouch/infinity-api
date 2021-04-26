<?php
namespace App\Controller;
use App\Controller\AppController;

class TemplatesController extends AppController
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
				if (!empty($data['keywords'])) {
					$keywords = $data['keywords'];
					$condition['Templates.name ILIKE '] = "%$keywords%";
				}
			}
			$query = $this->Templates->find();
			if (!empty($filter)) {
				$query->innerJoinWith('Websites', function($websites) use ($filter) {
					return $websites->where([
							'Websites.id' => $filter['website_id'],
						]);
				})
				->contain(['Components'])
				->where($condition);
			} else {
				$query
					->contain(['Components'])
					->where($condition);
			}
			$response = [];
			if ($query) {
				$response = $query->toArray();
			}
			$http_code = 200;
			$message = 'Success';
			return $this->Response->Response($http_code, $message, $response);
		}
	}

	public function add()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			if ($this->Response->allowOnlySuperUser($auth['group_id'])) {
				$entity = $this->Templates->newEntity();
				$request_body = $this->request->input('json_decode');
				$data = (array)$request_body;
				$patchEntity = $this->Templates->patchEntity($entity, $data);
				if ($this->Templates->save($patchEntity)) {
					$http_code = 200;
					$message = 'Success';
					return $this->Response->Response($http_code, $message);
				} else {
					$http_code = 400;
					$message = 'Add not success';
					return $this->Response->Response($http_code, $message, null, $patchEntity->errors());
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
			$auth = $this->Auth->user();
			if ($this->Response->allowOnlySuperUser($auth['group_id'])) {
				$request_body = $this->request->input('json_decode');
				$query = $this->Templates->get($request_body->id);
				if ($query) {
					$http_code = 200;
					$message = 'Success';
					return $this->Response->Response($http_code, $message, $query);
				} else {
					$http_code = 404;
					$message = 'User not found.';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				$http_code = 403;
				$message = 'Unauthorized';
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
				$query = $this->Templates->get($request_body->id);
				$data = (array)$request_body;
				$patchEntity = $this->Templates->patchEntity($query, $data);
				if ($this->Templates->save($patchEntity)) {
					$http_code = 200;
					$message = 'Success';
					return $this->Response->Response($http_code, $message);
				} else {
					$http_code = 400;
					$message = 'Edit not success';
					return $this->Response->Response($http_code, $message, null, $patchEntity->errors());
				}
			} else {
				$http_code = 403;
				$message = 'Unauthorized';
				return $this->Response->Response($http_code, $message, null, null);
			}
		}
	}

	public function delete()
	{
		if ($this->request->is(['patch', 'post', 'put'])) {
			$auth = $this->Auth->user();
			if ($this->Response->allowOnlySuperUser($auth['group_id'])) {
				$request_body = $this->request->input('json_decode');
				$query = $this->Templates->get($request_body->id);
				if ($this->Templates->delete($query)) {
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
