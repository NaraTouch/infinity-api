<?php
namespace App\Model\Table;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class GGMainSlidersTable extends Table
{

	public function initialize(array $config)
	{
		parent::initialize($config);

		$this->setTable('gg_main_sliders');
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
			->scalar('image')
			->allowEmptyString('image');

		$validator
			->scalar('display')
			->maxLength('display', 255)
			->allowEmptyString('display');
		
		$validator
			->scalar('descriptions')
			->allowEmptyString('descriptions');
		
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
