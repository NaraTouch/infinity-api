<?php
namespace App\Model\Table;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class PermissionsTable extends Table {

	public function initialize(array $config) {
		$this->setPrimaryKey('id');
		$this->addBehavior('Timestamp');

		$this->belongsTo('Roles')
			->setForeignKey('role_id');

		$this->belongsTo('Methods')
			->setForeignKey('method_id')
			->setDependent(true);
	}

	public function validationDefault(Validator $validator)
	{
		$validator
			->nonNegativeInteger('role_id')
			->allowEmptyString('role_id', null, 'create')
			->notEmpty('role_id', 'Role '.MESSAGE_REQUIRED);
	
		$validator
			->nonNegativeInteger('method_id')
			->maxLength('method_id', 255)
			->notEmpty('method_id', 'Method '.MESSAGE_REQUIRED)
			->add('method_id', [
				'unique' => [
					'rule' => ['validateUnique', ['scope' => 'role_id']],
					'provider' => 'table'
				]
			]);

		return $validator;
	}
}