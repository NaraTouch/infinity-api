<?php
namespace App\Controller\Component;
use Cake\Controller\Component;

class ResponseComponent extends Component
{

	public function initialize(array $config)
	{
		parent::initialize($config);
	}

	public function Response($http_code = null, $message = null, $data = [], $error = [])
	{
		$http_status = (int) $http_code;
		$response = [
			'ErrorCode' => $http_status,
			'Message' => $message,
			'Data' => $data,
			'Error' => $error
		];
		return $this->response->withType('application/json')
			->withStatus($http_status)
			->withStringBody(json_encode($response));
	}

	public function Message($http_code = null)
	{
		$http_status = (int) $http_code;
		$message = '';
		if ($http_status == 400) {
			$message = 'Bad Request';
		} else if ($http_status == 401) {
			$message = 'Unauthorized';
		} else if ($http_status == 402) {
			$message = 'Your session has been logout';
		} else if ($http_status == 403) {
			$message = 'Forbidden';
		} else if ($http_status == 404) {
			$message = 'Not Found';
		} else if ($http_status == 405) {
			$message = 'Method Not Allowed';
		} else if ($http_status == 408) {
			$message = 'Request Timeout';
		} else if ($http_status == 500) {
			$message = 'Internal Server Error';
		} else if ($http_status == 502) {
			$message = 'Bad Gateway';
		} else if ($http_status == 503) {
			$message = 'Service Unavailable';
		} else if ($http_status == 511) {
			$message = 'Network Authentication Required';
		} else {
			$message = 'Unknow Error';
		}
		$response = [
			'ErrorCode' => $http_status,
			'Message' => $message,
		];
		return $this->response->withType('application/json')
			->withStatus($http_status)
			->withStringBody(json_encode($response));
	}
}