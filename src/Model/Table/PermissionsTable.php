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
	
		$this->belongsTo('Modules')
			->setForeignKey('module_id')
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
		$validator
			->nonNegativeInteger('module_id')
			->maxLength('module_id', 255)
			->notEmpty('module_id', 'Modules '.MESSAGE_REQUIRED)
			->add('module_id', [
				'unique' => [
					'rule' => ['validateUnique', ['scope' => 'role_id']],
					'provider' => 'table'
				]
			]);

		return $validator;
	}

	public function checkPermission($role = null, $access_url = null)
	{
		if (!$role || !$access_url) {
			return false;
		}
		$query = $this->find()
					->where([
						'role_id' => $role->id,
						'method_id' => $access_url['method']->id,
						'module_id' => $access_url['module']->id,
					])
					->first();
		if ($query) {
			return $query;
		}
		return false;
	}
}