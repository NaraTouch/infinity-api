<?php
namespace App\Model\Table;
use Cake\ORM\Table;

class PermissionsTable extends Table {

	public function initialize(array $config) {
		$this->setPrimaryKey('id');
		$this->addBehavior('Timestamp');

		$this->belongsTo('Roles')
			->setForeignKey('role_id');

		$this->belongsTo('Methods')
			->setForeignKey('method_id')
			->setDependent(true);
	}
}