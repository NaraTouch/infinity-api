<?php
namespace App\Form;

use Cake\Form\Form;
use Cake\Validation\Validator;
use Cake\Form\Schema;

class FileForm extends Form
{
	
	public function validationUpload($validator)
		{
		return $validator
			->add('path', 'valid', ['rule' => 'notBlank'])
			->add('filename', 'valid', ['rule' => 'notBlank'])
			->add('progresshash', 'valid', ['rule' => 'notBlank']);
	}

}