<?php
namespace App\Model\Table;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class GroupsTable extends Table
{

	public function initialize(array $config)
	{
		parent::initialize($config);

		$this->setTable('groups');
		$this->setDisplayField('name');
		$this->setPrimaryKey('id');

		$this->hasMany('Users', [
			'foreignKey' => 'group_id',
		]);
	}

	public function validationDefault(Validator $validator)
	{
		$validator
			->nonNegativeInteger('id')
			->allowEmptyString('id', null, 'create');

		$validator
			->scalar('display_name')
			->maxLength('display_name', 180)
			->notEmptyString('display_name');

		$validator
			->scalar('name')
			->maxLength('name', 180)
			->notEmptyString('name');

		return $validator;
	}
}
