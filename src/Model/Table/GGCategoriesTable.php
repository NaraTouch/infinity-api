<?php
namespace App\Model\Table;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class GGCategoriesTable extends Table
{

	public function initialize(array $config)
	{
		parent::initialize($config);

		$this->setTable('gg_categories');
		$this->addBehavior('Timestamp');
		$this->setPrimaryKey('id');
	
		$this->belongsTo('Websites')
			->setForeignKey('website_id')
			->setDependent(true);
	}

	public function validationDefault(Validator $validator)
	{
		$validator
			->nonNegativeInteger('id')
			->allowEmptyString('id', null, 'create');

		$validator
			->scalar('website_id')
			->requirePresence('website_id')
			->notEmpty('website_id');

		$validator
			->scalar('title')
			->maxLength('title', 50)
			->notEmptyString('display');
		
		$validator
			->scalar('icon')
			->allowEmptyString('icon');
		
		$validator
			->scalar('tag_links')
			->allowEmptyString('tag_links');

		$validator
			->nonNegativeInteger('sort')
			->numeric('sort')
			->notEmpty('sort')
			->add('sort', [
				'unique' => [
					'rule' => ['validateUnique', ['scope' => 'website_id']],
					'provider' => 'table'
				]
			]);
	
		$validator
			->boolean('active')
			->allowEmptyString('active');
	
		return $validator;
	}

}
