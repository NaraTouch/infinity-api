<?php
namespace App\Model\Table;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class TemplatesTable extends Table
{

	public function initialize(array $config)
	{
		parent::initialize($config);

		$this->setTable('templates');
		$this->addBehavior('Timestamp');
		$this->setPrimaryKey('id');

		$this->hasMany('Components', [
			'foreignKey' => 'template_id',
		]);
		$this->hasMany('Websites', [
			'foreignKey' => 'template_id',
		]);
	}

	public function validationDefault(Validator $validator)
	{
		$validator
			->nonNegativeInteger('id')
			->allowEmptyString('id', null, 'create');

		$validator
			->scalar('name')
			->maxLength('name', 180)
			->notEmptyString('name');
	
		$validator
			->scalar('description')
			->allowEmptyString('description');

		$validator
			->nonNegativeInteger('sort')
			->numeric('sort')
			->notEmpty('sort')
			->add('sort', [
				'unique' => [
					'rule' => ['validateUnique', ['scope' => 'id']],
					'provider' => 'table'
				]
			]);
	
		$validator
			->boolean('active')
			->allowEmptyString('active');

		return $validator;
	}

	public function buildRules(RulesChecker $rules)
	{
		$rules->add($rules->isUnique(['name']));
		$rules->add($rules->isUnique(['title']));

		return $rules;
	}
	
}
