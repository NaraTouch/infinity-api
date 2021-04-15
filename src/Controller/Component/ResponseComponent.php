<?php
namespace App\Controller\Component;
use Cake\Controller\Component;
use Cake\ORM\TableRegistry;

class ResponseComponent extends Component
{
	private $Groups;
	private $Roles;
	
	public function initialize(array $config)
	{
		parent::initialize($config);
		$this->Groups = TableRegistry::get('Groups');
		$this->Roles = TableRegistry::get('Roles');
	}

	public function getFilterByWebsite($group_id = null)
	{
		if (!$group_id) {
			return false;
		}
		$group = $this->Groups->getGroupById($group_id);
		if ($group) {
			if ($group->super_user) {
				return [];
			} else {
				return ['website_id' => $group->website_id];
			}
		} else {
			return false;
		}
	}

	public function getFilterByGroup($group_id = null)
	{
		if (!$group_id) {
			return false;
		}
		$group = $this->Groups->getGroupById($group_id);
		if ($group) {
			if ($group->super_user) {
				return [];
			} else {
				return ['group_id' => $group->id];
			}
		} else {
			return false;
		}
	}

	public function getFilterRole($id = null)
	{
		if (!$id) {
			return false;
		}
		$role = $this->Roles->getRoleById($id);
		if ($role) {
			return ['group_id' => $role->group_id];
		} else {
			return false;
		}
	}
	
	public function validateTheSameValue($valid_value = null, $value = null)
	{
		if (!$valid_value || !$value) {
			return false;
		}
		if ($valid_value == $valid_value) {
			return true;
		}
		return false;
	}

	public function checkSuperUser($group_id = null)
	{
		if (!$group_id) {
			return false;
		}
		$group = $this->Groups->getGroupById($group_id);
		if ($group) {
			if ($group->super_user) {
				return [];
			} else {
				return ['super_user' => false];
			}
		} else {
			return false;
		}
	}

	public function allowOnlySuperUser($group_id = null)
	{
		if (!$group_id) {
			return false;
		}
		$group = $this->Groups->getGroupById($group_id);
		if ($group) {
			if ($group->super_user) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
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
			$message = 'Your session has been logout from data center. Please logout and login again.';
		} else if ($http_status == 402) {
			$message = 'Unauthorized';
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

	public function PcloudMessage($error = null, $message = null)
	{
		$http_status = 404;
		$response = [
			'ErrorCode' => $error,
			'Message' => $message,
		];
		return $this->response->withType('application/json')
			->withStatus($http_status)
			->withStringBody(json_encode($response));
	}
}