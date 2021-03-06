<?php
namespace App\Model\Table;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class UsersTable extends Table
{

	public function initialize(array $config)
	{
		parent::initialize($config);

		$this->setTable('users');
		$this->setDisplayField('name');
		$this->setPrimaryKey('id');

		$this->addBehavior('Timestamp');

		$this->belongsTo('Roles', [
			'foreignKey' => 'role_id',
			'joinType' => 'INNER',
		]);
		$this->hasOne('Tokens')
			->setForeignKey('user_id');
	}

	public function validationDefault(Validator $validator)
	{
		$validator
			->nonNegativeInteger('id')
			->allowEmptyString('id', null, 'create');

		$validator
			->requirePresence('name')
			->maxLength('name', 255)
			->notEmpty('name', 'Name'.MESSAGE_REQUIRED);
	
		$validator
			->requirePresence('email')
			->maxLength('email', 50)
			->notEmpty('email', 'Email'.MESSAGE_REQUIRED);

		$validator
			->scalar('password')
			->maxLength('password', 255)
			->minLength('password', 8, 'Password minimun 8 charaters')
			->requirePresence('password', 'create')
			->notEmpty('password', MESSAGE_REQUIRED)
			->add('password',
					'custom',[
						'rule' => function ($value, $context) {
							if (!preg_match("/[A-Z]/", $value)
								|| !preg_match("/\W/", $value)
								|| !preg_match("/\d/", $value)) {
								return false;
							}
							return true;
						},
						'message' => 'The password is required to be at least 8 carats and have uppercase letters, numbers and special characters (@#$%^&*)',
					]);
		$validator
			->boolean('active')
			->allowEmptyString('active');
	
		$validator
			->requirePresence('role_id')
			->maxLength('role_id', 255)
			->notEmpty('role_id', 'Role'.MESSAGE_REQUIRED);

		return $validator;
	}

	public function buildRules(RulesChecker $rules)
	{
		$rules->add($rules->isUnique(['email']));
		$rules->add($rules->existsIn(['role_id'], 'Roles'));

		return $rules;
	}
}
