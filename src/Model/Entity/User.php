<?php
namespace App\Model\Entity;
use Cake\ORM\Entity;
use Cake\Auth\DefaultPasswordHasher;

class User extends Entity
{

	protected $_accessible = [
		'role_id' => true,
		'name' => true,
		'email' => true,
		'password' => true,
		'active' => true,
		'created' => true,
		'modified' => true,
		'role' => true,
	];

	protected $_hidden = [
		'password',
	];

	protected function _setPassword($password) {
		if (strlen($password) > 0) {
			return (new DefaultPasswordHasher)->hash($password);
		}
	}
}
