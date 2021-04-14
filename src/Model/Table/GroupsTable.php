<?php
namespace App\Model\Table;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class GroupsTable extends Table
{

	public function initialize(array $config)
	{
		parent::initialize($config);

		$this->setTable('groups');
		$this->setDisplayField('name');
		$this->addBehavior('Timestamp');
		$this->setPrimaryKey('id');

		$this->hasMany('Users', [
			'foreignKey' => 'group_id',
		]);
		$this->hasMany('Roles', [
			'foreignKey' => 'group_id',
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
			->scalar('code')
			->maxLength('code', 10);

		$validator
			->boolean('active')
			->allowEmptyString('active');
	
		$validator
			->boolean('super_user')
			->allowEmptyString('super_user');

		return $validator;
	}

	public function getGroupById($id = null)
	{
		if (!$id) {
			return $id;
		}
		$query = $this->find()
				->where(['id' => $id])
				->first();
		if ($query) {
			return $query;
		}
		return false;
	}

	public function buildRules(RulesChecker $rules)
	{
		$rules->add($rules->isUnique(['name']));
		$rules->add($rules->isUnique(['code']));

		return $rules;
	}
}
