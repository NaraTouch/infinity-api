<?php
namespace App\Model\Table;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class ModulesTable extends Table
{

	public function initialize(array $config)
	{
		parent::initialize($config);

		$this->setTable('modules');
		$this->setDisplayField('name');
		$this->addBehavior('Timestamp');
		$this->setPrimaryKey('id');

		$this->hasMany('Methods', [
			'foreignKey' => 'module_id',
		]);
	}

	public function validationDefault(Validator $validator)
	{
		$validator
			->nonNegativeInteger('id')
			->allowEmptyString('id', null, 'create');

		$validator
			->scalar('name')
			->maxLength('name', 50)
			->notEmptyString('name');

		$validator
			->scalar('display')
			->maxLength('display', 180)
			->notEmptyString('display');
		
		$validator
			->scalar('symbol')
			->maxLength('symbol', 180)
			->notEmptyString('symbol');

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

	public function getModuleByName($name = null)
	{
		$query = $this->find()
				->where([
					'name' => $name,
					'active' => 1
				])
				->first();
		if ($query) {
			return $query;
		}
		return false;
	}

	public function buildRules(RulesChecker $rules)
	{
		$rules->add($rules->isUnique(['sort']));
		$rules->add($rules->isUnique(['name']));

		return $rules;
	}
}
