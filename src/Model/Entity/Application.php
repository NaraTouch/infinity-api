<?php
namespace App\Model\Entity;
use Cake\ORM\Entity;

class Application extends Entity
{

	protected $_accessible = [
		'*' => true,
		'id' => false,
	];
}
