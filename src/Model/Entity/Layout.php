<?php
namespace App\Model\Entity;
use Cake\ORM\Entity;

class Layout extends Entity
{

	protected $_accessible = [
		'*' => true,
		'id' => false,
	];
}
