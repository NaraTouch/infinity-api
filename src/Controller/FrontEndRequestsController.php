<?php
namespace App\Controller;
use App\Controller\AppController;

class FrontEndRequestsController extends AppController
{

	public function initialize()
	{
		parent::initialize();
		$this->loadComponent('Validation');
		$this->loadComponent('Response');
		$this->Auth->allow(['frontEnd']);
	}

	public function frontEnd()
	{
		if ($this->request->is('post')) {
			$request = $this->request->input('json_decode');
			$request_body = (array)$request;
			$validate = $this->Validation->validateFrontEndRequest((array) $request_body);
			if (empty($validate)) {
				$website = $this->Response->getWebsiteByCode($request_body['code']);
				if ($website) {
					$response = $this->getDataByTableName($request_body['REQUEST_DATA']);
					$http_code = 200;
					$message = 'Success';
					return $this->Response->Response($http_code, $message, $response);
				} else {
					$http_code = 403;
					$message = 'Forbidden found.';
					return $this->Response->Response($http_code, $message, null, null);
				}
			} else {
				$http_code = 400;
				$message = 'Request Failed!!!';
				return $this->Response->Response($http_code, $message, null, $validate);
			}
		}
	}

	public function getDataByTableName($table_name = null)
	{
		if (!$table_name) {
			return false;
		}
		$data = [];
		$this->loadModel($table_name);
		$query = $this->$table_name->find()
				->where(['active' => 1])
				->order(['sort' => 'ASC']);
		if ($query) {
			$data = $query->toArray();
		}
		return $data;
	}
}
