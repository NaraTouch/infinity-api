<?php
namespace App\Controller;
use App\Controller\AppController;

class ComponentsController extends AppController
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
				if (!empty($data['template_id'])) {
					$template_id = $data['template_id'];
					$condition['Components.template_id '] = $template_id;
				}
				if (!empty($data['keywords'])) {
					$keywords = $data['keywords'];
					$condition['Components.name ILIKE '] = "%$keywords%";
				}
			}
			$query = $this->Components->find();
			if (!empty($filter)) {
				$query->innerJoinWith('Templates', function($template) use ($filter) {
					return $template->innerJoinWith('Websites', function($website) use ($filter) {
						return $website->where([
							'Websites.id' => $filter['website_id'],
						]);
					});
				})
				->contain(['Templates'])
				->where($condition);
			} else {
				$query
					->contain(['Templates'])
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
				$entity = $this->Components->newEntity();
				$request_body = $this->request->input('json_decode');
				$data = (array)$request_body;
				$patchEntity = $this->Components->patchEntity($entity, $data);
				if ($this->Components->save($patchEntity)) {
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
				$query = $this->Components->get($request_body->id);
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
				$query = $this->Components->get($request_body->id);
				$data = (array)$request_body;
				$patchEntity = $this->Components->patchEntity($query, $data);
				if ($this->Components->save($patchEntity)) {
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
				$query = $this->Components->get($request_body->id);
				if ($this->Components->delete($query)) {
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
