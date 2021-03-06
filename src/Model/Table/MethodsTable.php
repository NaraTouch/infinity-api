<?php
namespace App\Model\Table;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class MethodsTable extends Table
{

	public function initialize(array $config)
	{
		parent::initialize($config);

		$this->setTable('methods');
		$this->setDisplayField('name');
		$this->addBehavior('Timestamp');
		$this->setPrimaryKey('id');

		$this->belongsTo('Modules')
			->setForeignKey('module_id')
			->setDependent(true);
		$this->hasMany('Permissions', [
			'foreignKey' => 'method_id',
		]);
	}

	public function validationDefault(Validator $validator)
	{
		$validator
			->nonNegativeInteger('id')
			->allowEmptyString('id', null, 'create');

		$validator
			->scalar('module_id')
			->requirePresence('module_id')
			->notEmpty('module_id');

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
					'rule' => ['validateUnique', ['scope' => 'module_id']],
					'provider' => 'table'
				]
			]);

		$validator
			->boolean('is_menu')
			->allowEmptyString('is_menu');

		$validator
			->boolean('active')
			->allowEmptyString('active');

		return $validator;
	}

	public function getMethodByName($name = null, $module_id = null)
	{
		if (!$name || !$module_id) {
			return false;
		}
		$query = $this->find()
				->where([
					'module_id' => $module_id,
					'name' => $name,
					'active' => 1
				])
				->first();
		if ($query) {
			return $query;
		}
		return false;
	}
}
