<?php
namespace App\Model\Entity;
use Cake\ORM\Entity;

class Method extends Entity
{

	protected $_accessible = [
		'*' => true,
		'id' => false,
	];
}
