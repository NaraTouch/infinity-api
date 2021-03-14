<?php
namespace App\Model\Table;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;

class TokensTable extends Table
{

	public function initialize(array $config)
	{
		parent::initialize($config);

		$this->setTable('tokens');
		$this->setPrimaryKey('id');

		$this->addBehavior('Timestamp');

		$this->belongsTo('Users')
			->setForeignKey('user_id')
			->setDependent(true);
	}

	public function saveToken($user_id = null, $token = null)
	{
		$this->deleteAll(['user_id' => $user_id]);
		$data = [
			'user_id' => $user_id,
			'token' => $token,
		];
		$entity = $this->newEntity($data);
		if ($this->save($entity)) {
			return true;
		}
		return false;
		
	}
	
	public function getUserByToken($token = null)
	{
		if (!$token){
			return false;
		}
		$user =  $this->find()
				->where(['token' => $token])
				->contain(['Users'])
				->first();
		if ($user) {
			return $user;
		}
		return false;
	}

	public function buildRules(RulesChecker $rules)
	{
		$rules->add($rules->isUnique(['user_id']));

		return $rules;
	}
	
}
