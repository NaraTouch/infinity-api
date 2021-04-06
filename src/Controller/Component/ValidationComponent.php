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
		return $this->validator->errors($data);
	}
	
	public function validateUploadFileProgress($data = [])
	{
		$this->validator
			->requirePresence('progresshash')
			->notEmptyString('progresshash');
		return $this->validator->errors($data);
	}

	public function validateUploadFile($data = [])
	{
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
}