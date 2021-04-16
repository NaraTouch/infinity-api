<?php
namespace App\Model\Table;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class PcloudsTable extends Table
{

	public function initialize(array $config)
	{
		parent::initialize($config);

		$this->setTable('pclouds');
		$this->addBehavior('Timestamp');
		$this->setPrimaryKey('id');

		$this->belongsTo('Websites')
			->setForeignKey('website_id')
			->setDependent(true);
	}

	public function validationDefault(Validator $validator)
	{
		$validator
			->nonNegativeInteger('id')
			->allowEmptyString('id', null, 'create');

		$validator
			->scalar('email')
			->maxLength('email', 255)
			->notEmptyString('email');

		$validator
			->scalar('password')
			->maxLength('password', 255)
			->notEmptyString('password');

		$validator
			->boolean('active')
			->allowEmptyString('active');

		$validator
			->nonNegativeInteger('website_id')
			->allowEmptyString('website_id', null, 'create');

		return $validator;
	}

	public function buildRules(RulesChecker $rules)
	{
		$rules->add($rules->isUnique(['email']));
		$rules->add($rules->isUnique(['website_id']));

		return $rules;
	}
}
