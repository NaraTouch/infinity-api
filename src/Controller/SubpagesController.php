<?php
namespace App\Controller;
use App\Controller\AppController;

class SubpagesController extends AppController
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
					$condition['Subpages.name ILIKE '] = "%$keywords%";
				}
				if (!empty($data['page_id'])) {
					$page_id = $data['page_id'];
					$condition['Subpages.page_id '] = $page_id;
				}
			}
			$query = $this->Subpages->find();
			if (!empty($filter)) {
				$query->innerJoinWith('Pages', function($page) use ($filter) {
						return $page
							->where([
								'Pages.website_id' => $filter['website_id'],
							]);
					})
					->contain(['Pages'])
					->where($condition);
			} else {
				$query
					->contain(['Pages'])
					->where($condition);
			}
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
				$page = $this->Response->getFilterPage($data['page_id']);
				if ($this->Response->validateTheSameValue($filter['website_id'], $page['website_id'])) {
					return $this->addSubpage($data);
				} else {
					$http_code = 403;
					$message = 'Unauthorized';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				return $this->addSubpage($data);
			}
		}
	}

	public function addSubpage($data = null)
	{
		$entity = $this->Subpages->newEntity();
		$patchEntity = $this->Subpages->patchEntity($entity, $data);
		if ($this->Subpages->save($patchEntity)) {
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
			if (!empty($data)) {
				if (!empty($data['id'])) {
					$condition['Subpages.id'] = $data['id'];
				}
			}
			$query = $this->Subpages->find();
			if (!empty($filter)) {
				$query->innerJoinWith('Pages', function($page) use ($filter) {
						return $page
							->where([
								'Pages.website_id' => $filter['website_id'],
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

	public function edit()
	{
		if ($this->request->is(['patch', 'post', 'put'])) {
			$auth = $this->Auth->user();
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			$request_body = $this->request->input('json_decode');
			$query = $this->Subpages->get($request_body->id);
			$data = (array)$request_body;
			if (!empty($filter)) {
				$page = $this->Response->getFilterPage($data['page_id']);
				if ($this->Response->validateTheSameValue($filter['website_id'], $page['website_id'])) {
					return $this->editSubpage($data, $query);
				} else {
					$http_code = 403;
					$message = 'Unauthorized';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				return $this->editSubpage($data, $query);
			}
		}
	}

	public function editSubpage($data = null, $query = null)
	{
		$patchEntity = $this->Subpages->patchEntity($query, $data);
		if ($this->Subpages->save($patchEntity)) {
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
			$query = $this->Subpages->get($request_body->id);
			if (!empty($filter)) {
				$page = $this->Response->getFilterPage($query->page_id);
				if ($this->Response->validateTheSameValue($filter['website_id'], $page['website_id'])) {
					return $this->deleteSubpage($query);
				} else {
					$http_code = 403;
					$message = 'Unauthorized';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				return $this->deleteSubpage($query);
			}
		}
	}
	
	public function deleteSubpage($query = null)
	{
		if ($this->Subpages->delete($query)) {
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
