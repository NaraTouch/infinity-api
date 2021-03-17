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

	public function login($request = [])
	{
		$url = $this->pcloud_url.'/userinfo';
		$request = [
			'getauth' => 1,
			'logout' => 1,
			'username' => $this->username,
			'password' => $this->password
		];
		$http_method = 'POST';
		return $this->openUrl($url, $request, $http_method);
	}

	public function listDirectory($path = null)
	{
		$response = [];
		$login = $this->login();
		dump($login);
		if ($login) {
			$url = $this->pcloud_url.'/listfolder';
			$path = 'path='.'/Documents';
			$http_method = 'POST';
			$response = $this->openUrlWithNoCovertParam($url, $path, $http_method);
		}
		return $response;
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
	
	private function openUrlWithNoCovertParam($url = null, $param = null, $http_method = null)
	{
		if (!$url || !$param) {
			return [];
		}
		dump($url.'?'.$param);
		$curl = curl_init();

		curl_setopt_array($curl, array(
			CURLOPT_URL => 'https://api.pcloud.com/listfolder?path=/Documents',
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => '',
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 0,
			CURLOPT_FOLLOWLOCATION => true,
			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			CURLOPT_CUSTOMREQUEST => 'POST',
		));

		$response = curl_exec($curl);

		curl_close($curl);
		echo $response;
	}

}