<?php
namespace App\Model\Entity;
use Cake\ORM\Entity;
use Cake\Auth\DefaultPasswordHasher;

class Token extends Entity
{

	protected $_accessible = [
		'*' => true,
		'id' => false,
	];

}
