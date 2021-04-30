<?php
namespace App\Controller;
use App\Controller\AppController;

class WebsiteRequestsController extends AppController
{

	public function initialize()
	{
		parent::initialize();
		$this->loadModel('Pclouds');
		$this->loadComponent('Response');
	}

	public function authorization()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			$website = $this->Response->getWebsiteByGroup($auth['group_id']);
			if ($website) {
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message, $website);
			} else {
				$http_code = 404;
				$message = 'Website Not Found!!!';
				return $this->Response->Response($http_code, $message);
			}
		}
	}
	
	public function webLayouts()
	{
		if ($this->request->is('post')) {
			dump('test');
		}
	}

	
}
