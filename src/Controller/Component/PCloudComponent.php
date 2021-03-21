<?php
namespace App\Controller\Component;
use Cake\Controller\Component;

class PCloudComponent extends Component
{

	private $pcloud_url;
	private $username;
	private $password;
	public function initialize(array $config)
	{
		parent::initialize($config);
		$this->username = 'sophonaratouch@gmail.com';
		$this->password = 'konpig0989';
		$this->pcloud_url = 'https://api.pcloud.com';
	}

	public function login()
	{
		$url = $this->pcloud_url.'/userinfo';
		$data = [];
		$request = [
			'getauth' => 1,
			'logout' => 1,
			'username' => $this->username,
			'password' => $this->password
		];
		$http_method = 'POST';
		$response = $this->openUrl($url, $request, $http_method);
		if ($response) {
			$data = json_decode($response);
		}
		return $data;
	}

	public function listDirectory($path = null)
	{
		$data = [];
		$login = $this->login();
		if ($login) {
			$url = $this->pcloud_url.'/listfolder';
			$request = [
				'path' => $path,
				'auth' => $login->auth,
			];
			$http_method = 'POST';
			$response = $this->openUrl($url, $request, $http_method);
			if ($response) {
				$data = json_decode($response, true);
			}
		}
		return $data;
	}

	private function openUrl($url = null, $param = [], $http_method = null)
	{
		if (!$url || !$param) {
			return [];
		}
		$str_param = http_build_query($param);
		$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, $url);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_TIMEOUT, 60);
			curl_setopt($ch, CURLOPT_POSTFIELDS, $str_param);
			$output = curl_exec($ch);
		curl_close($ch);
		return $output;
	}
	
}