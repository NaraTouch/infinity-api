<?php
namespace App\Controller;
use App\Controller\AppController;
use Aws\S3\S3Client;
use Aws\S3\S3ClientInterface;
use Aws\Exception\AwsException;
use Cake\Http\Exception\NotFoundException;


class AWSController extends AppController
{

	private $S3;
	private $request_body;
	public function initialize(): void
	{
		$this->autoRender = false;
		$this->loadComponent('Response');
		$this->loadComponent('Validation');
		if ($this->request->input('json_decode')) {
			$this->request_body = $this->request->input('json_decode');
		} else if ($this->request->getData()) {
			$this->request_body = $this->request->getData();
		}
		$this->S3 = $this->_S3Service($this->request_body);
	}

	public function _S3Service($request_body = null)
	{
			$request = (array) $request_body;
			$validate = $this->Validation->validateS3Service($request);
			if (!empty($validate)) {
				$http_code = 401;
				$message = '(S3) Unthorization Failed.';
				return $this->responseBody($http_code, $message, null, $validate);
			}
			try {
				$_S3 = S3Client::factory(
					[
						'credentials' => [
							'key' => $request['IAM_KEY'],
							'secret' => $request['IAM_SECRET']
						],
						'version' => $request['VERSION'],
						'region'  => $request['REGION'],
					]
				);
				return $_S3;
			} catch (AwsException $error) {
				$http_code = $error->getStatusCode();
				$message = $error->getAwsErrorMessage();
				return $this->Response->Response($http_code, $message, null, null);
			}
	}

	public function putObject()
	{
		if ($this->request->is('post')) {
			$request = (array) $this->request_body;
			$validate = $this->Validation->validateputObject($request);
			if (!empty($validate)) {
				$http_code = 400;
				$message = 'Bad Request.';
				return $this->responseBody($http_code, $message, null, $validate);
			}
			if (isset($request['SourceFile'])) {
				$file = $request['SourceFile'];
				$name = $request['Key'].$file->getClientFilename();
				$tmp = $file->getFile();
				$type = $file->getClientMediaType();
				$request['Key'] = $name;
				$request['SourceFile'] = $tmp;
				$request['ContentType'] = $type;
			}
			try {
				$_s3Query = $this->S3->putObject($this->s3DataRequest($request));
				$http_code = 200;
				$message = 'success.';
				return $this->Response->Response($http_code, $message, $this->s3Data($_s3Query));
			} catch (AwsException $error) {
				$http_code = $error->getStatusCode();
				$message = $error->getAwsErrorMessage();
				return $this->Response->Response($http_code, $message, null, null);
			}
		}
	}

	public function getObjectAcl()
	{
		if ($this->request->is('post')) {
			$request = (array) $this->request_body;
			$validate = $this->Validation->validategetObjectAcl($request);
			if (!empty($validate)) {
				$http_code = 400;
				$message = 'Bad Request.';
				return $this->responseBody($http_code, $message, null, $validate);
			}
			try {
				$_s3Query = $this->S3->getObjectAcl($this->s3DataRequest($request));
				$http_code = 200;
				$message = 'success.';
				return $this->Response->Response($http_code, $message, $this->s3Data($_s3Query));
			} catch (AwsException $error) {
				$http_code = $error->getStatusCode();
				$message = $error->getAwsErrorMessage();
				return $this->Response->Response($http_code, $message, null, null);
			}
		}
	}

	public function getObjectUrl()
	{
		if ($this->request->is('post')) {
			$request = (array) $this->request_body;
			$validate = $this->Validation->validategetObjectUrl($request);
			if (!empty($validate)) {
				$http_code = 400;
				$message = 'Bad Request.';
				return $this->responseBody($http_code, $message, null, $validate);
			}
			try {
				$_s3Query = $this->S3->getObjectUrl($request['Bucket'], $request['Key']);
				$data = ['url' => $_s3Query];
				$http_code = 200;
				$message = 'success.';
				return $this->Response->Response($http_code, $message, $this->s3Data($_s3Query));
			} catch (AwsException $error) {
				$http_code = $error->getStatusCode();
				$message = $error->getAwsErrorMessage();
				return $this->Response->Response($http_code, $message, null, null);
			}
		}
	}

	public function deleteObject()
	{
		if ($this->request->is('post')) {
			$request = (array) $this->request_body;
			$validate = $this->Validation->validatedeleteObject($request);
			if (!empty($validate)) {
				$http_code = 400;
				$message = 'Bad Request.';
				return $this->responseBody($http_code, $message, null, $validate);
			}
			try {
				$_s3Query = $this->S3->deleteObject($this->s3DataRequest($request));
				$http_code = 200;
				$message = 'success.';
				return $this->Response->Response($http_code, $message, $this->s3Data($_s3Query));
			} catch (AwsException $error) {
				$http_code = $error->getStatusCode();
				$message = $error->getAwsErrorMessage();
				return $this->Response->Response($http_code, $message, null, null);
			}
		}
	}

	public function listObjects()
	{
		if ($this->request->is('post')) {
			$request = (array) $this->request_body;
			$validate = $this->Validation->validatelistObjects($request);
			if (!empty($validate)) {
				$http_code = 400;
				$message = 'Bad Request.';
				return $this->responseBody($http_code, $message, null, $validate);
			}
			try {
				$_s3Query = $this->S3->listObjects($this->s3DataRequest($request));
				$http_code = 200;
				$message = 'success.';
				return $this->Response->Response($http_code, $message, $this->s3Data($_s3Query));
			} catch (AwsException $error) {
				$http_code = $error->getStatusCode();
				$message = $error->getAwsErrorMessage();
				return $this->Response->Response($http_code, $message, null, null);
			}
		}
	}

	public function getObject()
	{
		if ($this->request->is('post')) {
			$request = (array) $this->request_body;
			$validate = $this->Validation->validategetObject($request);
			if (!empty($validate)) {
				$http_code = 400;
				$message = 'Bad Request.';
				return $this->responseBody($http_code, $message, null, $validate);
			}
			try {
				$_s3Query = $this->S3->getObject($this->s3DataRequest($request));
				$http_code = 200;
				$message = 'success.';
				return $this->Response->Response($http_code, $message, $this->s3Data($_s3Query));
			} catch (AwsException $error) {
				$http_code = $error->getStatusCode();
				$message = $error->getAwsErrorMessage();
				return $this->Response->Response($http_code, $message, null, null);
			}
		}
	}

	public function listBuckets()
	{
		if ($this->request->is('post')) {
			try {
				$_s3Query = $this->S3->listBuckets();
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message, $this->s3Data($_s3Query));
			} catch (AwsException $error) {
				$http_code = $error->getStatusCode();
				$message = $error->getAwsErrorMessage();
				return $this->Response->Response($http_code, $message, null, null);
			}
		}
	}

	public function deleteBucket()
	{
		if ($this->request->is('post')) {
			$request = (array) $this->request_body;
			$validate = $this->Validation->validatedeleteBucket($request);
			if (!empty($validate)) {
				$http_code = 400;
				$message = 'Bad Request.';
				return $this->responseBody($http_code, $message, null, $validate);
			}
			try {
				$_s3Query = $this->S3->deleteBucket($this->s3DataRequest($request));
				$http_code = 200;
				$message = 'success.';
				return $this->Response->Response($http_code, $message, $this->s3Data($_s3Query));
			} catch (AwsException $error) {
				$http_code = $error->getStatusCode();
				$message = $error->getAwsErrorMessage();
				return $this->Response->Response($http_code, $message, null, null);
			}
		}
	}

	public function createBucket()
	{
		if ($this->request->is('post')) {
			$request = (array) $this->request_body;
			$validate = $this->Validation->validatecreateBucket($request);
			if (!empty($validate)) {
				$http_code = 400;
				$message = 'Bad Request.';
				return $this->responseBody($http_code, $message, null, $validate);
			}
			try {
				$_s3Query = $this->S3->createBucket($this->s3DataRequest($request));
				$http_code = 200;
				$message = 'success.';
				return $this->Response->Response($http_code, $message, $this->s3Data($_s3Query));
			} catch (AwsException $error) {
				$http_code = $error->getStatusCode();
				$message = $error->getAwsErrorMessage();
				return $this->Response->Response($http_code, $message, null, null);
			}
		}
	}

	public function getBucketPolicy()
	{
		if ($this->request->is('post')) {
			$request = (array) $this->request_body;
			$validate = $this->Validation->validategetBucketPolicy($request);
			if (!empty($validate)) {
				$http_code = 400;
				$message = 'Bad Request.';
				return $this->responseBody($http_code, $message, null, $validate);
			}
			try {
				$_s3Query = $this->S3->getBucketPolicy($this->s3DataRequest($request));
				$http_code = 200;
				$message = 'success.';
				return $this->Response->Response($http_code, $message, $this->s3Data($_s3Query));
			} catch (AwsException $error) {
				$http_code = $error->getStatusCode();
				$message = $error->getAwsErrorMessage();
				return $this->Response->Response($http_code, $message, null, null);
			}
		}
	}

	public function putBucketPolicy()
	{
		if ($this->request->is('post')) {
			$request = (array) $this->request_body;
			$validate = $this->Validation->validateputBucketPolicy($request);
			if (!empty($validate)) {
				$http_code = 400;
				$message = 'Bad Request.';
				return $this->responseBody($http_code, $message, null, $validate);
			}
			try {
				$json = json_encode($this->s3DataRequest((array)$request['Policy']));
				$data = [
					'Bucket' => $request['Bucket'],
					'Policy' => $json
				];
				$_s3Query = $this->S3->putBucketPolicy($data);
				$http_code = 200;
				$message = 'success.';
				return $this->Response->Response($http_code, $message, $this->s3Data($_s3Query));
			} catch (AwsException $error) {
				$http_code = $error->getStatusCode();
				$message = $error->getAwsErrorMessage();
				return $this->Response->Response($http_code, $message, null, null);
			}
		}
	}

	public function deleteBucketPolicy()
	{
		if ($this->request->is('post')) {
			$request = (array) $this->request_body;
			$validate = $this->Validation->validatedeleteBucketPolicy($request);
			if (!empty($validate)) {
				$http_code = 400;
				$message = 'Bad Request.';
				return $this->responseBody($http_code, $message, null, $validate);
			}
			try {
				$_s3Query = $this->S3->deleteBucketPolicy($this->s3DataRequest($request));
				$http_code = 200;
				$message = 'success.';
				return $this->Response->Response($http_code, $message, $this->s3Data($_s3Query));
			} catch (AwsException $error) {
				$http_code = $error->getStatusCode();
				$message = $error->getAwsErrorMessage();
				return $this->Response->Response($http_code, $message, null, null);
			}
		}
	}

	public function getACL()
	{
		if ($this->request->is('post')) {
			$_s3Query = ['ACL' => ACL];
			$http_code = 200;
			$message = 'success.';
			$response = $this->Response->Response($http_code, $message, $_s3Query, null);
			return $this->responseBody($http_code, $response);
		}
	}
	public function getStorageClass()
	{
		if ($this->request->is('post')) {
			$_s3Query = ['StorageClass' => StorageClass];
			$http_code = 200;
			$message = 'success.';
			$response = $this->Response->Response($http_code, $message, $_s3Query, null);
			return $this->responseBody($http_code, $response);
		}
	}
	public function getLocationConstraint()
	{
		if ($this->request->is('post')) {
			$_s3Query = ['LocationConstraint' => LocationConstraint];
			$http_code = 200;
			$message = 'success.';
			$response = $this->Response->Response($http_code, $message, $_s3Query, null);
			return $this->responseBody($http_code, $response);
		}
	}

	public function s3DataRequest($data = [])
	{
		if (!$data) {
			return [];
		}
		unset($data['IAM_KEY']);
		unset($data['IAM_SECRET']);
		unset($data['VERSION']);
		unset($data['REGION']);
		return $data;
	}

	public function s3Data($data = [])
	{
		if (!$data) {
			return [];
		}
		$response = [];
		foreach ($data as $key => $value) {
			if ($key[0] == '@') {
				$key = str_replace('@','',$key);
			}
			$response[$key] = $value;
		}
		return $response;
	}
}
