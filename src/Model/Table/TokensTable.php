<?php
namespace App\Model\Table;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\ORM\TableRegistry;

class TokensTable extends Table
{

	private $Modules;
	private $Methods;
	private $Groups;
	private $Roles;
	private $Permissions;

	public function initialize(array $config)
	{
		parent::initialize($config);
		$this->Modules = TableRegistry::get('Modules');
		$this->Methods = TableRegistry::get('Methods');
		$this->Groups = TableRegistry::get('Groups');
		$this->Roles = TableRegistry::get('Roles');
		$this->Permissions = TableRegistry::get('Permissions');
		
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

	public function buildRules(RulesChecker $rules)
	{
		$rules->add($rules->isUnique(['user_id']));
		return $rules;
	}

	public function getUserByToken($token = null, $controller = null, $action = null)
	{

		if (!$token){
			return false;
		}
		$user =  $this->find()
				->where(['token' => $token])
				->contain(['Users'])
				->first();
		if ($user) {
			$access_url = $this->checkAccessUrl($controller, $action);
			$role = $this->Roles->getRoleByGroup($user->user->group_id);
			if ($access_url && $role) {
				$permission = $this->AuthenticatorJudgement($role, $access_url);
				if ($permission) {
					return $user;
				} else {
					return false;
				}
			} else {
				return false;
			}
			
		}
		return false;
	}

	public function getUserByTokenOnly($token = null)
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
	
	public function checkAccessUrl($module_name = null, $method_name = null)
	{
		if (!$module_name || !$method_name)
		{
			return false;
		}
		$module = $this->Modules->getModuleByName($module_name);
		if ($module) {
			$method = $this->Methods->getMethodByName($method_name, $module->id);
			if ($method) {
				$data['module'] = $module;
				$data['method'] = $method;
				return $data;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}
	
	public function AuthenticatorJudgement($role = null, $access_url = null)
	{
		if (!$access_url || !$role) {
			return false;
		}
		$permission = $this->Permissions->checkPermission($role, $access_url);
		if ($permission) {
			return $permission;
		}
		return false;
	}
}
