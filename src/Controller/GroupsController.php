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
			$groups = $this->paginate($this->Groups);
			$data = [];
			if ($groups) {
				$data = $groups;
			}
			$http_code = 200;
			$message = 'Success';
			return $this->Response->Response($http_code, $message, $data);
		}
	}

	public function add()
	{
		if ($this->request->is('post')) {
			$group = $this->Groups->newEntity();
			$request_body = $this->request->input('json_decode');
			$data = (array)$request_body;
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

	public function view()
	{
		if ($this->request->is('post')) {
			$request_body = $this->request->input('json_decode');
			$group = $this->Groups->get($request_body->id);
			if ($group) {
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message, $group);
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
			$request_body = $this->request->input('json_decode');
			$group = $this->Groups->get($request_body->id);
			$data = (array)$request_body;
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
}
