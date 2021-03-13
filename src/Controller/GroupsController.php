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

//	public function view($id = null)
//	{
//		if ($this->request->is('post')) {
//			$user = $this->Users->get($id, [
//				'contain' => ['Groups'],
//			]);
//			$data = [];
//			if ($user) {
//				$data = $user;
//			}
//			$http_code = 200;
//			$message = 'Success';
//			return $this->Response->Response($http_code, $message, $data);
//		}
//		
//	}
//
//	public function add()
//	{
//		if ($this->request->is('post')) {
//			$user = $this->Users->newEntity();
//			$request_body = $this->request->input('json_decode');
//			$data = (array)$request_body;
//			$entity = $this->Users->patchEntity($user, $data);
//			if ($this->Users->save($entity)) {
//				$http_code = 200;
//				$message = 'Success';
//				return $this->Response->Response($http_code, $message);
//			} else {
//				$http_code = 400;
//				$message = 'Success';
//				return $this->Response->Response($http_code, $message, null, $entity->errors());
//			}
//		}
//	}
//
//	public function edit($id = null)
//	{
//		$user = $this->Users->get($id, [
//			'contain' => [],
//		]);
//		if ($this->request->is(['patch', 'post', 'put'])) {
//			$user = $this->Users->patchEntity($user, $this->request->getData());
//			if ($this->Users->save($user)) {
//				$this->Flash->success(__('The user has been saved.'));
//
//				return $this->redirect(['action' => 'index']);
//			}
//			$this->Flash->error(__('The user could not be saved. Please, try again.'));
//		}
//		$roles = $this->Users->Roles->find('list', ['limit' => 200]);
//		$this->set(compact('user', 'roles'));
//	}
//
//	public function delete($id = null)
//	{
//		$this->request->allowMethod(['post', 'delete']);
//		$user = $this->Users->get($id);
//		if ($this->Users->delete($user)) {
//			$this->Flash->success(__('The user has been deleted.'));
//		} else {
//			$this->Flash->error(__('The user could not be deleted. Please, try again.'));
//		}
//
//		return $this->redirect(['action' => 'index']);
//	}
}
