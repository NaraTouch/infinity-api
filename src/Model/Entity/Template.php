<?php
namespace App\Model\Entity;
use Cake\ORM\Entity;

class Template extends Entity
{

	protected $_accessible = [
		'*' => true,
		'id' => false,
	];
}
