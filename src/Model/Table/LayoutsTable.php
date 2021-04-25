<?php
namespace App\Model\Table;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class LayoutsTable extends Table
{

	public function initialize(array $config)
	{
		parent::initialize($config);

		$this->setTable('layouts');
		$this->addBehavior('Timestamp');
		$this->setPrimaryKey('id');

		$this->belongsTo('Subpages')
			->setForeignKey('subpage_id')
			->setDependent(true);
	
		$this->belongsTo('Components')
			->setForeignKey('component_id')
			->setDependent(true);
	}

	public function validationDefault(Validator $validator)
	{
		$validator
			->nonNegativeInteger('id')
			->allowEmptyString('id', null, 'create');

		$validator
			->scalar('subpage_id')
			->requirePresence('subpage_id')
			->notEmpty('subpage_id');
		
		$validator
			->scalar('component_id')
			->requirePresence('component_id')
			->notEmpty('component_id')
			->add('component_id', [
				'unique' => [
					'rule' => ['validateUnique', ['scope' => 'subpage_id']],
					'provider' => 'table'
				]
			]);

		$validator
			->nonNegativeInteger('sort')
			->numeric('sort')
			->notEmpty('sort')
			->add('sort', [
				'unique' => [
					'rule' => ['validateUnique', ['scope' => 'subpage_id']],
					'provider' => 'table'
				]
			]);

		$validator
			->boolean('active')
			->allowEmptyString('active');
	
		return $validator;
	}
}
