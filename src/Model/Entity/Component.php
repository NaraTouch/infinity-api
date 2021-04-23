<?php
namespace App\Model\Entity;
use Cake\ORM\Entity;

class Component extends Entity
{

	protected $_accessible = [
		'*' => true,
		'id' => false,
	];
}
