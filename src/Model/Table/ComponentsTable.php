<?php
namespace App\Model\Table;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class ComponentsTable extends Table
{

	public function initialize(array $config)
	{
		parent::initialize($config);

		$this->setTable('components');
		$this->addBehavior('Timestamp');
		$this->setPrimaryKey('id');

		$this->belongsTo('Templates')
			->setForeignKey('template_id')
			->setDependent(true);
		$this->hasMany('Layouts', [
			'foreignKey' => 'component_id',
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
			->scalar('table_name')
			->maxLength('table_name', 180)
			->notEmptyString('table_name');

		
		$validator
			->scalar('description')
			->allowEmptyString('description');
		
		$validator
			->nonNegativeInteger('sort')
			->numeric('sort')
			->notEmpty('sort')
			->add('sort', [
				'unique' => [
					'rule' => ['validateUnique', ['scope' => 'template_id']],
					'provider' => 'table'
				]
			]);
	
		$validator
			->scalar('scritp')
			->allowEmptyString('scritp');
		
		$validator
			->boolean('active')
			->allowEmptyString('active');
	
		return $validator;
	}

	public function buildRules(RulesChecker $rules)
	{
		$rules->add($rules->isUnique(['name']));
		$rules->add($rules->isUnique(['table_name']));

		return $rules;
	}
}
