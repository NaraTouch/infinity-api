<?php
namespace App\Model\Table;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class ApplicationsTable extends Table
{

	public function initialize(array $config)
	{
		parent::initialize($config);

		$this->setTable('applications');
		$this->addBehavior('Timestamp');
		$this->setPrimaryKey('id');

		$this->belongsTo('Templates')
			->setForeignKey('template_id')
			->setDependent(true);
	
		$this->hasOne('Websites', [
			'foreignKey' => 'application_id',
		]);
	
	}

	public function validationDefault(Validator $validator)
	{
		$validator
			->nonNegativeInteger('id')
			->allowEmptyString('id', null, 'create');

		$validator
			->scalar('template_id')
			->requirePresence('template_id')
			->notEmpty('template_id');

		$validator
			->scalar('name')
			->maxLength('name', 50)
			->notEmptyString('name');
		
		$validator
			->scalar('display')
			->maxLength('display', 180)
			->notEmptyString('display');

		
		$validator
			->scalar('script')
			->allowEmptyString('script');
		
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
