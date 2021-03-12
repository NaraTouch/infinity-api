<?php
namespace App\Model\Entity;
use Cake\ORM\Entity;

class Group extends Entity
{

	protected $keyType = 'string';
	protected $_accessible = [
		'*' => true,
		'id' => false,
	];
}
