<?php
namespace App\Controller\Component;
use Cake\Controller\Component;
use Cake\Validation\Validator;

class ValidationComponent extends Component
{

	private $validator;

	public function initialize(array $config)
	{
		parent::initialize($config);
		$this->validator = new Validator();
	}

	//Validation for P-Cloud
	public function validateListDirectory($data = [])
	{
		$this->validator
			->requirePresence('path')
			->notEmptyString('path');
		$this->validator
			->requirePresence('website_id')
			->notEmptyString('website_id');
		return $this->validator->errors($data);
	}

	public function validateCreateFolderIfNotExists($data = [])
	{
		$this->validator
			->requirePresence('path')
			->notEmptyString('path');
		$this->validator
			->requirePresence('folder_id')
			->notEmptyString('folder_id');
		$this->validator
			->requirePresence('name')
			->notEmptyString('name');
		$this->validator
			->requirePresence('website_id')
			->notEmptyString('website_id');
		return $this->validator->errors($data);
	}

	public function validateDeleteFolder($data = [])
	{
		$this->validator
			->requirePresence('folder_id')
			->notEmptyString('folder_id');
		$this->validator
			->requirePresence('path')
			->notEmptyString('path');
		$this->validator
			->requirePresence('website_id')
			->notEmptyString('website_id');
		return $this->validator->errors($data);
	}

	public function validateRenameFolder($data = [])
	{
		$this->validator
			->requirePresence('folder_id')
			->notEmptyString('folder_id');
		$this->validator
			->requirePresence('name')
			->notEmptyString('name');
		$this->validator
			->requirePresence('website_id')
			->notEmptyString('website_id');
		return $this->validator->errors($data);
	}

	public function validateRenameFile($data = [])
	{
		$this->validator
			->requirePresence('file_id')
			->notEmptyString('file_id');
		$this->validator
			->requirePresence('name')
			->notEmptyString('name');
		$this->validator
			->requirePresence('website_id')
			->notEmptyString('website_id');
		return $this->validator->errors($data);
	}

	public function validateDeleteFile($data = [])
	{
		$this->validator
			->requirePresence('file_id')
			->notEmptyString('file_id');
		$this->validator
			->requirePresence('path')
			->notEmptyString('path');
		$this->validator
			->requirePresence('website_id')
			->notEmptyString('website_id');
		return $this->validator->errors($data);
	}
	
	public function validateUploadFileProgress($data = [])
	{
		$this->validator
			->requirePresence('progresshash')
			->notEmptyString('progresshash');
		$this->validator
			->requirePresence('website_id')
			->notEmptyString('website_id');
		return $this->validator->errors($data);
	}

	public function validateUploadFile($data = [])
	{
		$this->validator
			->requirePresence('website_id')
			->notEmptyString('website_id');
	
		$this->validator
			->requirePresence('path')
			->notEmptyString('path')
			->add('path', 'custom', [
				'rule' => function($value) {
					if ($value == '/') {
						return false;
					} else {
						return true;
					}
				},
				'message' => MESSAGE_INVALIDE_DIRECTTORY,
			]);
	
		$this->validator
			->requirePresence('folderid')
			->notEmptyString('folderid')
			->add('folderid', 'custom', [
				'rule' => function($value) {
					if ($value == '0') {
						return false;
					} else {
						return true;
					}
				},
				'message' => MESSAGE_INVALIDE_DIRECTTORY,
			]);
	
		$this->validator
			->requirePresence('filename')
			->notEmptyString('filename');
	
		$this->validator
			->requirePresence('file')
			->notEmpty('file')
			->add('file', 'custom', [
				'rule' => function($value) {
					$_ext = explode('/', $value['type']);
					if (!in_array(strtolower($_ext[1]), IMAGE_EXTENTION)) {
						return false;
					} else {
						return true;
					}
				},
				'message' => MESSAGE_INVALIDE_FILE,
			]);
		return $this->validator->errors($data);
	}
	
	public function validateFrontEndRequest($data = [])
	{
		$this->validator
			->requirePresence('code')
			->notEmptyString('code');
		$this->validator
			->requirePresence('REQUEST_DATA')
			->notEmptyString('REQUEST_DATA');
		return $this->validator->errors($data);
	}
	
	
	// AWS S3

	//Validation _S3Service
	public function validateS3Service($data = [])
	{
		$this->validator
			->requirePresence('IAM_KEY')
			->notEmptyString('IAM_KEY');
		$this->validator
			->requirePresence('IAM_SECRET')
			->notEmptyString('IAM_SECRET');
		$this->validator
			->requirePresence('VERSION')
			->notEmptyString('VERSION');
		$this->validator
			->requirePresence('REGION')
			->notEmptyString('REGION');

		return $this->validator->errors($data);
	}
	/* $result = $client->getObject([
		'Bucket' => '<string>', // REQUIRED
		'ExpectedBucketOwner' => '<string>',
		'IfMatch' => '<string>',
		'IfModifiedSince' => <integer || string || DateTime>,
		'IfNoneMatch' => '<string>',
		'IfUnmodifiedSince' => <integer || string || DateTime>,
		'Key' => '<string>', // REQUIRED
		'PartNumber' => <integer>,
		'Range' => '<string>',
		'RequestPayer' => 'requester',
		'ResponseCacheControl' => '<string>',
		'ResponseContentDisposition' => '<string>',
		'ResponseContentEncoding' => '<string>',
		'ResponseContentLanguage' => '<string>',
		'ResponseContentType' => '<string>',
		'ResponseExpires' => <integer || string || DateTime>,
		'SSECustomerAlgorithm' => '<string>',
		'SSECustomerKey' => '<string>',
		'SSECustomerKeyMD5' => '<string>',
		'SaveAs' => '<string>',
		'VersionId' => '<string>',
	]); */
	public function validategetObject($data = [])
	{
		$this->validator
			->requirePresence('Bucket')
			->notEmptyString('Bucket');
		$this->validator
			->requirePresence('Key')
			->allowEmptyString('Key');
		$this->validator
			->notEmptyString('ExpectedBucketOwner');
		$this->validator
			->notEmptyString('IfMatch');
		$this->validator
			->notEmptyString('IfModifiedSince');
		$this->validator
			->notEmptyString('IfNoneMatch');
		$this->validator
			->notEmptyString('IfUnmodifiedSince');
		$this->validator
			->notEmptyString('PartNumber');
		$this->validator
			->notEmptyString('Range');
		$this->validator
			->notEmptyString('RequestPayer');
		$this->validator
			->notEmptyString('ResponseCacheControl');
		$this->validator
			->notEmptyString('ResponseContentDisposition');
		$this->validator
			->notEmptyString('ResponseContentEncoding');
		$this->validator
			->notEmptyString('ResponseContentLanguage');
		$this->validator
			->notEmptyString('ResponseContentType');
		$this->validator
			->notEmptyString('ResponseExpires');
		$this->validator
			->notEmptyString('SSECustomerAlgorithm');
		$this->validator
			->notEmptyString('SSECustomerKey');
		$this->validator
			->notEmptyString('SSECustomerKeyMD5');
		$this->validator
		   ->notEmptyString('SaveAs');
		$this->validator
		  ->notEmptyString('VersionId');

		return $this->validator->errors($data);
	}
	/* $result = $client->putObject([
		'ACL' => 'private|public-read|public-read-write|authenticated-read|aws-exec-read|bucket-owner-read|bucket-owner-full-control',
		'Body' => <string || resource || Psr\Http\Message\StreamInterface>,
		'Bucket' => '<string>', // REQUIRED
		'BucketKeyEnabled' => true || false,
		'CacheControl' => '<string>',
		'ContentDisposition' => '<string>',
		'ContentEncoding' => '<string>',
		'ContentLanguage' => '<string>',
		'ContentLength' => <integer>,
		'ContentSHA256' => '<string>',
		'ContentType' => '<string>',
		'ExpectedBucketOwner' => '<string>',
		'Expires' => <integer || string || DateTime>,
		'GrantFullControl' => '<string>',
		'GrantRead' => '<string>',
		'GrantReadACP' => '<string>',
		'GrantWriteACP' => '<string>',
		'Key' => '<string>', // REQUIRED
		'Metadata' => ['<string>', ...],
		'ObjectLockLegalHoldStatus' => 'ON|OFF',
		'ObjectLockMode' => 'GOVERNANCE|COMPLIANCE',
		'ObjectLockRetainUntilDate' => <integer || string || DateTime>,
		'RequestPayer' => 'requester',
		'SSECustomerAlgorithm' => '<string>',
		'SSECustomerKey' => '<string>',
		'SSECustomerKeyMD5' => '<string>',
		'SSEKMSEncryptionContext' => '<string>',
		'SSEKMSKeyId' => '<string>',
		'ServerSideEncryption' => 'AES256|aws:kms',
		'SourceFile' => '<string>',
		'StorageClass' => 'STANDARD|REDUCED_REDUNDANCY|STANDARD_IA|ONEZONE_IA|INTELLIGENT_TIERING|GLACIER|DEEP_ARCHIVE|OUTPOSTS',
		'Tagging' => '<string>',
		'WebsiteRedirectLocation' => '<string>',
	]); */
	 public function validateputObject($data = [])
	{
		$this->validator
			->requirePresence('ACL')
			->notEmptyString('ACL');
		$this->validator
			->requirePresence('Bucket')
			->notEmptyString('Bucket');
		$this->validator
			->requirePresence('Key')
			->notEmptyString('Key')
			->add('Key', 'custom', [
				'rule' => function($value) {
					$lastchar = $value[-1];
					if (strcmp($lastchar, "/") === 0 ) {
						return true;
					} else {
						return false;
					}
				},
				'message' => MESSAGE_INVALIDE_DIR,
			]);
		$this->validator
			// ->requirePresence('SourceFile')
			->notEmpty('SourceFile')
			->add('SourceFile', 'custom', [
				'rule' => function($value) {
					$type = $value->getClientMediaType();
					$_ext = explode('/', $type);
					if (!in_array(strtolower($_ext[1]), IMAGE_EXTENTION)) {
						return false;
					} else {
						return true;
					}
				},
				'message' => MESSAGE_INVALIDE_FILE,
			]);
		$this->validator
			->notEmptyString('Body');
		$this->validator
			->notEmptyString('BucketKeyEnabled');
		$this->validator
			->notEmptyString('CacheControl');
		$this->validator
			->notEmptyString('ContentDisposition');
		$this->validator
			->notEmptyString('ContentEncoding');
		$this->validator
			->notEmptyString('ContentLanguage');
		$this->validator
			->notEmptyString('ContentLength');
		$this->validator
			->notEmptyString('ContentSHA256');
		$this->validator
			->notEmptyString('ContentType');
		$this->validator
			->notEmptyString('ExpectedBucketOwner');
		$this->validator
			->notEmptyString('Expires');
		$this->validator
			->notEmptyString('GrantFullControl');
		$this->validator
			->notEmptyString('GrantRead');
		$this->validator
			->notEmptyString('GrantReadACP');
		$this->validator
			->notEmptyString('GrantWriteACP');
		$this->validator
			->notEmptyString('Metadata');
		$this->validator
			->notEmptyString('ObjectLockLegalHoldStatus');
		$this->validator
			->notEmptyString('ObjectLockMode');
		$this->validator
			->notEmptyString('ObjectLockRetainUntilDate');
		$this->validator
			->notEmptyString('RequestPayer');
		$this->validator
			->notEmptyString('SSECustomerAlgorithm');
		$this->validator
			->notEmptyString('SSECustomerKey');
		$this->validator
			->notEmptyString('SSECustomerKeyMD5');
		$this->validator
			->notEmptyString('SSEKMSEncryptionContext');
		$this->validator
			->notEmptyString('SSEKMSKeyId');
		$this->validator
			->notEmptyString('ServerSideEncryption');
		$this->validator
			->notEmptyString('SourceFile');
		$this->validator
			->notEmptyString('StorageClass');
		$this->validator
			->notEmptyString('Tagging');
		$this->validator
			->notEmptyString('WebsiteRedirectLocation');

		return $this->validator->errors($data);
	}
	/*$result = $client->getObjectAcl([
		'Bucket' => '<string>', // REQUIRED
		'ExpectedBucketOwner' => '<string>',
		'Key' => '<string>', // REQUIRED
		'RequestPayer' => 'requester',
		'VersionId' => '<string>',
	]);*/
	public function validategetObjectAcl($data = [])
	{
		$this->validator
			->requirePresence('Bucket')
			->notEmptyString('Bucket');
		$this->validator
			->requirePresence('Key')
			->allowEmptyString('Key');
		$this->validator
			->notEmptyString('ExpectedBucketOwner');
		$this->validator
			->notEmptyString('RequestPayer');
		$this->validator
			->notEmptyString('VersionId');

		return $this->validator->errors($data);
	}
	/*$result = $client->getObjectUrl([
		'Bucket' => '<string>', // REQUIRED
		'Key' => '<string>', // REQUIRED
	]);*/
	public function validategetObjectUrl($data = [])
	{
		$this->validator
			->requirePresence('Bucket')
			->notEmptyString('Bucket');
		$this->validator
			->requirePresence('Key')
			->allowEmptyString('Key');
		return $this->validator->errors($data);
	}
	/* $result = $client->deleteObject([
		'Bucket' => '<string>', // REQUIRED
		'BypassGovernanceRetention' => true || false,
		'ExpectedBucketOwner' => '<string>',
		'Key' => '<string>', // REQUIRED
		'MFA' => '<string>',
		'RequestPayer' => 'requester',
		'VersionId' => '<string>',
	]); */
	public function validatedeleteObject($data = [])
	{
		$this->validator
			->requirePresence('Bucket')
			->notEmptyString('Bucket');
		$this->validator
			->requirePresence('Key')
			->allowEmptyString('Key');
		$this->validator
			->add('BypassGovernanceRetention',
					'boolean', ['rule' => 'boolean']);
		$this->validator
			->notEmptyString('ExpectedBucketOwner');
		$this->validator
			->notEmptyString('MFA');
		$this->validator
			->notEmptyString('RequestPayer');
		$this->validator
			->notEmptyString('VersionId');

		return $this->validator->errors($data);
	}
	/* $result = $client->listObjects([
		'Bucket' => '<string>', // REQUIRED
		'Delimiter' => '<string>',
		'EncodingType' => 'url',
		'ExpectedBucketOwner' => '<string>',
		'Marker' => '<string>',
		'MaxKeys' => <integer>,
		'Prefix' => '<string>',
		'RequestPayer' => 'requester',
	]); */
	public function validatelistObjects($data = [])
	{
		$this->validator
			->requirePresence('Bucket')
			->notEmptyString('Bucket');
		$this->validator
			->requirePresence('Delimiter')
			->allowEmptyString('Delimiter');
		$this->validator
			->requirePresence('Prefix')
			->allowEmptyString('Prefix');
		$this->validator
			->notEmptyString('EncodingType');
		$this->validator
			->notEmptyString('ExpectedBucketOwner');
		$this->validator
			->notEmptyString('Marker');
		$this->validator
			->notEmptyString('MaxKeys');
		$this->validator
			->notEmptyString('RequestPayer');
		return $this->validator->errors($data);
	}

	/* $result = $client->deleteBucket([
		'Bucket' => '<string>', // REQUIRED
		'ExpectedBucketOwner' => '<string>',
	]); */
	public function validatedeleteBucket($data = [])
	{
		$this->validator
			->requirePresence('Bucket')
			->notEmptyString('Bucket');
		$this->validator
			->notEmptyString('ExpectedBucketOwner');
		return $this->validator->errors($data);
	}

	/* $result = $client->createBucket([
		'ACL' => 'private|public-read|public-read-write|authenticated-read',
		'Bucket' => '<string>', // REQUIRED
		'CreateBucketConfiguration' => [
			'LocationConstraint' => 'ap-northeast-1|ap-southeast-2|ap-southeast-1|cn-north-1|eu-central-1|eu-west-1|us-east-1|us-west-1|us-west-2|sa-east-1',
		],
		'GrantFullControl' => '<string>',
		'GrantRead' => '<string>',
		'GrantReadACP' => '<string>',
		'GrantWrite' => '<string>',
		'GrantWriteACP' => '<string>',
		'ObjectLockEnabledForBucket' => true || false,
	]); */
	public function validatecreateBucket($data = [])
	{
		$this->validator
			->requirePresence('Bucket')
			->notEmptyString('Bucket');

		$this->validator
			->notEmptyString('ACL');
		$this->validator
			->notEmptyString('CreateBucketConfiguration');
		$this->validator
			->notEmptyString('GrantFullControl');
		$this->validator
			->notEmptyString('GrantRead');
		$this->validator
			->notEmptyString('GrantReadACP');
		$this->validator
			->notEmptyString('GrantWrite');
		$this->validator
			->notEmptyString('GrantWriteACP');
		$this->validator
			->notEmptyString('ObjectLockEnabledForBucket');
		return $this->validator->errors($data);
	}

	/* $result = $client->getBucketPolicy([
		'Bucket' => '<string>', // REQUIRED
		'ExpectedBucketOwner' => '<string>',
	]); */
	public function validategetBucketPolicy($data = [])
	{
		$this->validator
			->requirePresence('Bucket')
			->notEmptyString('Bucket');
		$this->validator
			->notEmptyString('ExpectedBucketOwner');
		return $this->validator->errors($data);
	}

	/* $result = $client->putBucketPolicy([
		'Bucket' => '<string>', // REQUIRED
		'ConfirmRemoveSelfBucketAccess' => true || false,
		'ContentMD5' => '<string>',
		'ExpectedBucketOwner' => '<string>',
		'Policy' => '<string>', // REQUIRED
	]); */
	public function validateputBucketPolicy($data = [])
	{
		$this->validator
			->requirePresence('Bucket')
			->notEmptyString('Bucket');
		$this->validator
			->requirePresence('Policy')
			->notEmptyString('Policy');

		$this->validator
			->notEmptyString('ConfirmRemoveSelfBucketAccess');
		$this->validator
			->notEmptyString('ContentMD5');
		$this->validator
			->notEmptyString('ExpectedBucketOwner');

		return $this->validator->errors($data);
	}

	/* $result = $client->deleteBucketPolicy([
		'Bucket' => '<string>', // REQUIRED
		'ExpectedBucketOwner' => '<string>',
	]); */
	public function validatedeleteBucketPolicy($data = [])
	{
		$this->validator
			->requirePresence('Bucket')
			->notEmptyString('Bucket');
		$this->validator
			->notEmptyString('ExpectedBucketOwner');

		return $this->validator->errors($data);
	}
}