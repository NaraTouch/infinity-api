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
				foreach ($response as $key => $value) {
					if ($key != 'metadata') {
						$data[$key] = $value;
					}
					foreach ($response['metadata'] as $meta_key => $meta_value) {
						if ($meta_key != 'contents') {
							$data[$meta_key] = $meta_value;
						}
					}
					$contents = [];
					if ($response['metadata']['contents'] && count($response['metadata']['contents']) > 0) {
						foreach ($response['metadata']['contents'] as $con_key => $con_value) {
							if(strtolower($con_value['icon']) == 'image') {
								$image = [];
								foreach($con_value as $m_key => $m_value) {
									$image[$m_key] = $m_value;
								}
								$file_link = $this->getFilePublink($con_value['fileid'], $auth);
								$image['link'] = $file_link;
								$image['example_public_url'] = $this->pcloud_url.
										'/getpubthumb?fileid='
										.$con_value['fileid'].'&code='
										.$file_link['code']
										.'&size=1024x1024';
								$image['public_url'] = $this->pcloud_url.'/getpubthumb';
								$contents[$con_key] = $image;
							} else {
								$contents[$con_key] = $con_value;
							}
						}
					}
				}
				
				$data['contents'] = $contents;
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