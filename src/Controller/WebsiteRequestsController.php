<?php
namespace App\Controller;
use App\Controller\AppController;

class WebsiteRequestsController extends AppController
{

	public function initialize()
	{
		parent::initialize();
		$this->loadComponent('Response');
	}

	public function WebsiteRequests()
	{
		if ($this->request->is('post')) {
			dump('test');
		}
	}

	
}
