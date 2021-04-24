<?php
namespace App\Model\Entity;
use Cake\ORM\Entity;

class Pages extends Entity
{

	protected $_accessible = [
		'*' => true,
		'id' => false,
	];
}
