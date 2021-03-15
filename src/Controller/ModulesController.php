<?php
namespace App\Controller;
use App\Controller\AppController;

class ModulesController extends AppController
{

	public function initialize()
	{
		parent::initialize();
		$this->loadComponent('Response');
	}

	public function getModuleList()
	{
		if ($this->request->is('post')) {
			$query = $this->Modules->find()
			->order(['Modules.sort', 'Modules.name'])
			->contain(['Methods']);
			$data = [];
			if ($query) {
				$data = $query;
			}
			$http_code = 200;
			$message = 'Success';
			return $this->Response->Response($http_code, $message, $data);
		}
	}

	public function index()
	{
		if ($this->request->is('post')) {
			$this->paginate = [
				'contain' => ['Methods'],
			];
			$modules = $this->paginate($this->Modules);
			$data = [];
			if ($modules) {
				$data = $modules;
			}
			$http_code = 200;
			$message = 'Success';
			return $this->Response->Response($http_code, $message, $data);
		}
	}

	public function add()
	{
		if ($this->request->is('post')) {
			$module = $this->Modules->newEntity();
			$request_body = $this->request->input('json_decode');
			$data = (array)$request_body;
			$entity = $this->Modules->patchEntity($module, $data);
			if ($this->Modules->save($entity)) {
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
			$module = $this->Modules->get($request_body->id);
			if ($module) {
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message, $module);
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
			$module = $this->Modules->get($request_body->id);
			$data = (array)$request_body;
			$entity = $this->Modules->patchEntity($module, $data);
			if ($this->Modules->save($entity)) {
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
			$module = $this->Modules->get($request_body->id);
			if ($this->Modules->delete($module)) {
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
