<?php
namespace App\Controller\Component;
use Cake\Controller\Component;

class AWSComponent extends Component
{

	private $url;
	private $AccessKey;
	private $SecretKey;
	private $AWSRegion;
	private $ServiceName;
	private $SessionToken;
	private $now_time;
	
	public function initialize(array $config)
	{
		parent::initialize($config);
		$this->url = 'https://s3.amazonaws.com/';
		$this->AccessKey = 'AKIAT3F6HC3POPKOLPSO';
		$this->SecretKey = '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';
		$this->AWSRegion = 'us-east-1';
		$this->ServiceName = 's3';
		$this->SessionToken = '';
	}

	public function listing($bucket_name = null)
	{
		$url = $this->url.'/'.$bucket_name;
		$request = [];
		$http_method = 'POST';
		$response = $this->openUrl($url, $request, $http_method);
		dump($response);
//		if ($response) {
//			$data = json_decode($response);
//		}
//		return $data;
	}

	private function openUrl($url = null, $request = [], $http_method = null)
	{
		if (!$url) {
			return [];
		}
		$content = file_get_contents($url);
		$header = [
			'X-Amz-Content-Sha256: '.hash('sha256', $content),
			'X-Amz-Date: '.gmdate('Ymd\THis\Z'),
				'Authorization: AWS4-HMAC-SHA256 '
				. 'Credential=AKIAT3F6HC3POPKOLPSO/20210713/us-east-1/s3/aws4_request, '
				. 'SignedHeaders=host;x-amz-content-sha256;x-amz-date, '
				. 'Signature=ca1480ae23fb5374b4557d764ca56f26b8945e50661cad130a69474c1090a07a'
		];
		dump($header);
		$curl = curl_init();

		curl_setopt_array($curl, array(
			CURLOPT_URL => 'https://s3.amazonaws.com/',
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => '',
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 0,
			CURLOPT_FOLLOWLOCATION => true,
			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			CURLOPT_CUSTOMREQUEST => 'GET',
			CURLOPT_HTTPHEADER => $header,
		));

		$response = curl_exec($curl);
		curl_close($curl);
		return $response;
	}

	
	
	private function openAWSUrl()
	{
		$aws_access_key_id = $this->AccessKey;
		$aws_secret_access_key = $this->SecretKey;

		// Bucket
		$bucket_name = '';

		// AWS region and Host Name (Host names are different for each AWS region)
		// As an example these are set to us-east-1 (US Standard)
		$aws_region = 'us-east-1';
		$host_name = $bucket_name . '.s3.amazonaws.com';

		// Server path where content is present. This is just an example
		$content_path = 'img/color.png';
		$content = file_get_contents($content_path);

		// AWS file permissions
		$content_acl = 'authenticated-read';

		// MIME type of file. Very important to set if you later plan to load the file from a S3 url in the browser (images, for example)
		$content_type = 'image/png';
		// Name of content on S3
		$content_title = 'sample-image-8.png';

		// Service name for S3
		$aws_service_name = 's3';

		// UTC timestamp and date
		$timestamp = gmdate('Ymd\THis\Z');
		$date = gmdate('Ymd');

		// HTTP request headers as key & value
		$request_headers = array();
		$request_headers['Content-Type'] = $content_type;
		$request_headers['Date'] = $timestamp;
		$request_headers['Host'] = $host_name;
		$request_headers['x-amz-acl'] = $content_acl;
		$request_headers['x-amz-content-sha256'] = hash('sha256', $content);
		// Sort it in ascending order
		ksort($request_headers);

		// Canonical headers
		$canonical_headers = [];
		foreach($request_headers as $key => $value) {
			$canonical_headers[] = strtolower($key) . ":" . $value;
		}
		$canonical_headers = implode("\n", $canonical_headers);

		// Signed headers
		$signed_headers = [];
		foreach($request_headers as $key => $value) {
			$signed_headers[] = strtolower($key);
		}
		$signed_headers = implode(";", $signed_headers);

		// Cannonical request 
		$canonical_request = [];
		$canonical_request[] = "PUT";
		$canonical_request[] = "/" . $content_title;
		$canonical_request[] = "";
		$canonical_request[] = $canonical_headers;
		$canonical_request[] = "";
		$canonical_request[] = $signed_headers;
		$canonical_request[] = hash('sha256', $content);
		$canonical_request = implode("\n", $canonical_request);
		$hashed_canonical_request = hash('sha256', $canonical_request);

		// AWS Scope
		$scope = [];
		$scope[] = $date;
		$scope[] = $aws_region;
		$scope[] = $aws_service_name;
		$scope[] = "aws4_request";

		// String to sign
		$string_to_sign = [];
		$string_to_sign[] = "AWS4-HMAC-SHA256"; 
		$string_to_sign[] = $timestamp; 
		$string_to_sign[] = implode('/', $scope);
		$string_to_sign[] = $hashed_canonical_request;
		$string_to_sign = implode("\n", $string_to_sign);

		// Signing key
		$kSecret = 'AWS4' . $aws_secret_access_key;
		$kDate = hash_hmac('sha256', $date, $kSecret, true);
		$kRegion = hash_hmac('sha256', $aws_region, $kDate, true);
		$kService = hash_hmac('sha256', $aws_service_name, $kRegion, true);
		$kSigning = hash_hmac('sha256', 'aws4_request', $kService, true);

		// Signature
		$signature = hash_hmac('sha256', $string_to_sign, $kSigning);

		// Authorization
		$authorization = [
			'Credential=' . $aws_access_key_id . '/' . implode('/', $scope),
			'SignedHeaders=' . $signed_headers,
			'Signature=' . $signature
		];
		$authorization = 'AWS4-HMAC-SHA256' . ' ' . implode( ',', $authorization);

		// Curl headers
		$curl_headers = [ 'Authorization: ' . $authorization ];
		foreach($request_headers as $key => $value) {
			$curl_headers[] = $key . ": " . $value;
		}

		$url = 'https://' . $host_name . '/' . $content_title;
		$ch = curl_init($url);
		curl_setopt($ch, CURLOPT_HEADER, false);
		curl_setopt($ch, CURLOPT_HTTPHEADER, $curl_headers);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, false);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
		curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "PUT");
		curl_setopt($ch, CURLOPT_POSTFIELDS, $content);
		$response =  curl_exec($ch);
		$http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
		curl_close($curl);
		return $response;
	}
}