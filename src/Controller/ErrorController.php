<?php
namespace App\Controller;
use Cake\Event\Event;

class ErrorController extends AppController
{

	public function initialize()
	{
		$this->loadComponent('RequestHandler', [
			'enableBeforeRedirect' => false,
		]);
		$this->autoRender = false;
		$this->loadComponent('Response');
	}

	public function beforeRender(Event $event)
	{
		parent::beforeRender($event);
		$error = $this->response->getStatusCode();
		if ($error != 200) {
			return $this->redirect(['controller' => 'Error', 'action' => 'Message', $error]);
		}
	}

	public function Message($http_code = null)
	{
		return $this->Response->Message($http_code);
	}

	public function beforeFilter(Event $event)
	{
	}

	public function afterFilter(Event $event)
	{
	}
}
