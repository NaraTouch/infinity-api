<?php
namespace App\Model\Table;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class LocalFileManagersTable extends Table
{

	public function initialize(array $config)
	{
		parent::initialize($config);

		$this->setTable('local_file_managers');
		$this->setDisplayField('name');
		$this->setPrimaryKey('id');

		$this->addBehavior('Timestamp');

		$this->belongsTo('Groups', [
			'foreignKey' => 'group_id',
			'joinType' => 'INNER',
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
			->allowEmptyString('group_id');
	
		$validator
			->requirePresence('web_url')
			->maxLength('web_url', 255)
			->notEmpty('web_url', 'Web Url'.MESSAGE_REQUIRED);

		$validator
			->requirePresence('secret_key')
			->maxLength('secret_key', 255)
			->notEmpty('secret_key', 'Secret Key'.MESSAGE_REQUIRED);
	
		$validator
			->boolean('active')
			->allowEmptyString('active');

		return $validator;
	}

	public function buildRules(RulesChecker $rules)
	{
		$rules->add($rules->isUnique(['web_url']));
		$rules->add($rules->isUnique(['secret_key']));
		$rules->add($rules->existsIn(['group_id'], 'Groups'));

		return $rules;
	}
}
