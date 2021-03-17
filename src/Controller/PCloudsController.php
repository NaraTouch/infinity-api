<?php
namespace App\Controller;
use App\Controller\AppController;

class PCloudsController extends AppController
{

	public function initialize()
	{
		parent::initialize();
		$this->loadComponent('PCloud');
	}

	public function login()
	{
		if ($this->request->is('post')) {
			$pcloud = $this->PCloud->listDirectory();
		}
	}

}
