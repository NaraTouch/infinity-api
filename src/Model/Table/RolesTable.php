<?php
namespace App\Model\Table;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class RolesTable extends Table
{

	public function initialize(array $config)
	{
		parent::initialize($config);

		$this->setTable('roles');
		$this->setDisplayField('name');
		$this->addBehavior('Timestamp');
		$this->setPrimaryKey('id');

		$this->hasMany('Groups', [
			'foreignKey' => 'group_id',
		]);
	}

	public function validationDefault(Validator $validator)
	{
		$validator
			->nonNegativeInteger('id')
			->allowEmptyString('id', null, 'create');

		$validator
			->scalar('group_id')
			->requirePresence('group_id')
			->notEmpty('group_id');

		$validator
			->scalar('name')
			->maxLength('name', 50)
			->notEmptyString('name');

		$validator
			->scalar('display')
			->maxLength('display', 180)
			->notEmptyString('display');

		$validator
			->boolean('active')
			->allowEmptyString('active');

		return $validator;
	}
	
	public function buildRules(RulesChecker $rules)
	{
		$rules->add($rules->isUnique(['name']));

		return $rules;
	}
}
