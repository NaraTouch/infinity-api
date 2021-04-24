<?php
namespace App\Model\Table;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class SubpagesTable extends Table
{

	public function initialize(array $config)
	{
		parent::initialize($config);

		$this->setTable('subpages');
		$this->addBehavior('Timestamp');
		$this->setPrimaryKey('id');

		$this->belongsTo('Pages')
			->setForeignKey('page_id')
			->setDependent(true);
	}

	public function validationDefault(Validator $validator)
	{
		$validator
			->nonNegativeInteger('id')
			->allowEmptyString('id', null, 'create');

		$validator
			->scalar('page_id')
			->notEmptyString('page_id');

		$validator
			->scalar('name')
			->notEmptyString('name')
			->add('name', [
				'unique' => [
					'rule' => ['validateUnique', ['scope' => 'page_id']],
					'provider' => 'table'
				]
			]);
	
		$validator
			->scalar('display')
			->maxLength('display', 180)
			->notEmptyString('display')
			->add('display', [
				'unique' => [
					'rule' => ['validateUnique', ['scope' => 'page_id']],
					'provider' => 'table'
				]
			]);
		
		$validator
			->scalar('tag_links')
			->maxLength('tag_links', 250)
			->notEmptyString('tag_links')
			->add('tag_links', [
				'unique' => [
					'rule' => ['validateUnique', ['scope' => 'page_id']],
					'provider' => 'table'
				]
			]);
		
		$validator
			->scalar('icon')
			->maxLength('icon', 250)
			->allowEmptyString('icon');

		$validator
			->scalar('code')
			->maxLength('code', 50)
			->notEmptyString('code')
			->add('code', [
				'unique' => [
					'rule' => ['validateUnique', ['scope' => 'page_id']],
					'provider' => 'table'
				]
			]);
		
		$validator
			->nonNegativeInteger('sort')
			->numeric('sort')
			->notEmpty('sort')
			->add('sort', [
				'unique' => [
					'rule' => ['validateUnique', ['scope' => 'page_id']],
					'provider' => 'table'
				]
			]);

		$validator
			->boolean('active')
			->allowEmptyString('active');
	
		return $validator;
	}

}
