<?php
namespace App\Model\Entity;
use Cake\ORM\Entity;

class LocalFileManager extends Entity
{

	protected $_accessible = [
		'*' => true,
		'id' => false,
	];

}
