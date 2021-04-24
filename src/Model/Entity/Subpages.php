<?php
namespace App\Model\Entity;
use Cake\ORM\Entity;

class Subpages extends Entity
{

	protected $_accessible = [
		'*' => true,
		'id' => false,
	];
}
