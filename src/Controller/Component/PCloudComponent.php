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
			$auth = $login->auth;
			$request = [
				'path' => $path,
				'auth' => $auth,
			];
			$http_method = 'POST';
			$response = $this->openUrl($url, $request, $http_method);
			if ($response) {
				$response = json_decode($response, true);
				$data = $response;
				$auth_dir = [];
				if ($response['metadata']['contents'] && count($response['metadata']['contents']) > 0) {
					$folder_pub = $this->getFolderPublink($response['metadata']['folderid'], $auth);
					if ($folder_pub) {
						$folder_auth = json_decode($folder_pub, true);
						if ($folder_auth['result'] == 0) {
							$auth_dir = $folder_auth;
						}
					}
				}
				$data['metadata']['auth'] = $auth_dir;
				$data['metadata']['pub_example'] = $this->pcloud_url.
										'/getpubthumb?fileid=fileid'
										.'&code=code'
										.'&size=widthxheight';
				$data['metadata']['pub_url'] = $this->pcloud_url.'/getpubthumb';
			}
		}
		return $data;
	}

	public function getFilePublink($file_id = null, $auth = null)
	{
		$data = [];
		$request = [
				'auth' => $auth,
				'fileid' => $file_id,
			];
		$url = $this->pcloud_url.'/getfilepublink';
		$http_method = 'POST';
		$response = $this->openUrl($url, $request, $http_method);
		if ($response) {
			$data = json_decode($response, true);
		}
		return $data;
	}

	public function getFolderPublink($folder_id = null, $auth = null)
	{
		$data = [];
		$request = [
				'auth' => $auth,
				'folderid' => $folder_id,
			];
		$url = $this->pcloud_url.'/getfolderpublink';
		$http_method = 'POST';
		$response = $this->openUrl($url, $request, $http_method);
		if ($response) {
			$data = $response;
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