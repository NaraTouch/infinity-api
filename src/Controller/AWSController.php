<?php
namespace App\Controller;
use App\Controller\AppController;

class AWSController extends AppController
{

	public function initialize()
	{
		parent::initialize();
		$this->loadComponent('AWS');
		$this->loadComponent('Response');
		$this->loadComponent('Validation');
	}

	public function index()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			$response = $this->AWS->listing();
			dump('test');
		}
	}
	
}
