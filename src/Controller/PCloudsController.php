<?php
namespace App\Controller;
use App\Controller\AppController;

class PCloudsController extends AppController
{

	public function initialize()
	{
		parent::initialize();
		$this->loadComponent('PCloud');
		$this->loadComponent('Response');
	}

	public function listFolder()
	{
		if ($this->request->is('post')) {
			$request_body = $this->request->input('json_decode');
			if ($request_body) {
				$path = $request_body->path;
				$dir = $this->PCloud->listDirectory($path);
				if ($dir) {
					if ($dir['result'] === 0) {
						$http_code = 200;
						$message = 'Success';
						return $this->Response->Response($http_code, $message, $dir);
					} else {
						$http_code = $dir['result'];
						$message = $dir['error'];
						return $this->Response->PcloudMessage($http_code, $message);
					}
				} else {
					$http_code = 500;
					$message = 'Internal Server Error';
					return $this->Response->Response($http_code, $message);
				}
			} else {
				$http_code = 404;
				$message = 'User not found.';
				return $this->Response->Response($http_code, $message, null, null);
			}
			
		}
	}

}
