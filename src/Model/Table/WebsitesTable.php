<?php
namespace App\Model\Table;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class WebsitesTable extends Table
{

	public function initialize(array $config)
	{
		parent::initialize($config);

		$this->setTable('websites');
		$this->setDisplayField('name');
		$this->addBehavior('Timestamp');
		$this->setPrimaryKey('id');

		$this->hasOne('Groups', [
			'foreignKey' => 'website_id',
		]);
		$this->hasOne('PClounds', [
			'foreignKey' => 'website_id',
		]);
		$this->hasMany('Pages', [
			'foreignKey' => 'website_id',
		]);
	
		$this->belongsTo('Templates')
			->setForeignKey('template_id')
			->setDependent(true);

		$this->belongsTo('Applications')
			->setForeignKey('application_id');
		
		$this->hasMany('GGMainSliders', [
			'foreignKey' => 'website_id',
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
			->scalar('domain')
			->notEmptyString('domain');
	
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
			->scalar('template_id')
			->allowEmptyString('template_id');
	
		$validator
			->scalar('application_id')
			->allowEmptyString('application_id');
	
		return $validator;
	}

	public function buildRules(RulesChecker $rules)
	{
		$rules->add($rules->isUnique(['name']));
		$rules->add($rules->isUnique(['domain']));
		$rules->add($rules->isUnique(['display']));
		$rules->add($rules->isUnique(['code']));

		return $rules;
	}
	
	public function getWebsiteById($id = null)
	{
		if (!$id) {
			return false;
		}
		$query = $this->find()
					->where(['id' => $id])
					->first();
		if (!$query) {
			return false;
		}
		return $query;
	}
}
