<?php
namespace App\Model\Entity;
use Cake\ORM\Entity;

class Pcloud extends Entity
{

	protected $_accessible = [
		'*' => true,
		'id' => false,
	];
}
