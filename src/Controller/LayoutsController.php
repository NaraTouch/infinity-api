<?php
namespace App\Controller;
use App\Controller\AppController;

class LayoutsController extends AppController
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
				if (!empty($data['subpage_id'])) {
					$subpage_id = $data['subpage_id'];
					$condition['Layouts.subpage_id '] = $subpage_id;
				}
			}
			$query = $this->Layouts->find();
			if (!empty($filter)) {
				$query->innerJoinWith('Subpages', function($subpage) use ($filter) {
					return $subpage->innerJoinWith('Pages', function($page) use ($filter) {
						return $page->where([
							'Pages.website_id' => $filter['website_id'],
						]);
					});
				})
				->contain([
					'Subpages',
					'Components',
				])
				->where($condition);
			} else {
				$query
					->contain([
						'Subpages',
						'Components',
					])
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
			$filter = $this->Response->getFilterByWebsite($auth['group_id']);
			$request_body = $this->request->input('json_decode');
			$data = (array)$request_body;
			$entity = $this->Layouts->newEntity();
			$patchEntity = $this->Layouts->patchEntity($entity, $data);
			if (!empty($filter)) {
				$subpage = $this->Response->getWebsiteBySubpage($data['subpage_id']);
				if ($subpage && $this->Response->validateTheSameValue($filter['website_id'], $subpage['website_id'])) {
					return $this->addLayout($patchEntity);
				} else {
					$http_code = 403;
					$message = 'Unauthorized';
					return $this->Response->Response($http_code, $message, null, $patchEntity->errors());
				}
			} else {
				return $this->addLayout($patchEntity);
			}
		}
	}

	public function addLayout($patchEntity = null)
	{
		if ($this->Layouts->save($patchEntity)) {
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
					$condition['Layouts.id'] = $data['id'];
				}
			}
			$query = $this->Layouts->find();
			if (!empty($filter)) {
				$query->innerJoinWith('Subpages', function($subpage) use ($filter) {
					return $subpage->innerJoinWith('Pages', function($page) use ($filter) {
						return $page->where([
							'Pages.website_id' => $filter['website_id'],
						]);
					});
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
			$query = $this->Layouts->get($request_body->id);
			$data = (array)$request_body;
			if (!empty($filter)) {
				$subpage = $this->Response->getWebsiteBySubpage($data['subpage_id']);
				if ($subpage && $this->Response->validateTheSameValue($filter['website_id'], $subpage['website_id'])) {
					return $this->editLayout($query, $data);
				} else {
					$http_code = 403;
					$message = 'Unauthorized';
					return $this->Response->Response($http_code, $message, null, $patchEntity->errors());
				}
			} else {
				return $this->editLayout($query, $data);
			}
		}
	}

	public function editLayout($query = null, $data = [])
	{
		$patchEntity = $this->Layouts->patchEntity($query, $data);
		if ($this->Layouts->save($patchEntity)) {
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
			$query = $this->Layouts->get($request_body->id);
			if (!empty($filter)) {
				$subpage = $this->Response->getWebsiteBySubpage($query->subpage_id);
				if ($this->Response->validateTheSameValue($filter['website_id'], $subpage['website_id'])) {
					return $this->deleteLayout($query);
				} else {
					$http_code = 403;
					$message = 'Unauthorized';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				return $this->deleteLayout($query);
			}
		}
	}
	
	public function deleteLayout($query = null)
	{
		if ($this->Layouts->delete($query)) {
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
