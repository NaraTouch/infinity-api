<?php
use Cake\Routing\RouteBuilder;
use Cake\Routing\Router;
use Cake\Routing\Route\DashedRoute;
Router::defaultRouteClass(DashedRoute::class);

Router::scope('/', function (RouteBuilder $routes) {
	// Routes for users.
	$routes->connect('/users/login',
			[
				'controller' => 'Users',
				'action' => 'login'
			]);
	$routes->connect('/users',
			[
				'controller' => 'Users',
				'action' => 'index'
			]);
	$routes->connect('/users/add',
			[
				'controller' => 'Users',
				'action' => 'add'
			]);
	$routes->connect('/users/view',
			[
				'controller' => 'Users',
				'action' => 'view'
			]);
	$routes->connect('/users/edit',
			[
				'controller' => 'Users',
				'action' => 'edit'
			]);
	$routes->connect('/users/delete',
			[
				'controller' => 'Users',
				'action' => 'delete'
			]);
	
	// Groups
	$routes->connect('/groups',
			[
				'controller' => 'Groups',
				'action' => 'index'
			]);

	$routes->connect('/groups/add',
			[
				'controller' => 'Groups',
				'action' => 'add'
			]);
	$routes->connect('/groups/view',
			[
				'controller' => 'Groups',
				'action' => 'view'
			]);
	$routes->connect('/groups/edit',
			[
				'controller' => 'Groups',
				'action' => 'edit'
			]);
	$routes->connect('/groups/delete',
			[
				'controller' => 'Groups',
				'action' => 'delete'
			]);
	
	// Websites
	$routes->connect('/websites',
			[
				'controller' => 'Websites',
				'action' => 'index'
			]);

	$routes->connect('/websites/add',
			[
				'controller' => 'Websites',
				'action' => 'add'
			]);
	$routes->connect('/websites/view',
			[
				'controller' => 'Websites',
				'action' => 'view'
			]);
	$routes->connect('/websites/edit',
			[
				'controller' => 'Websites',
				'action' => 'edit'
			]);
	$routes->connect('/websites/delete',
			[
				'controller' => 'Websites',
				'action' => 'delete'
			]);
	
	// Roles
	$routes->connect('/roles',
			[
				'controller' => 'Roles',
				'action' => 'index'
			]);

	$routes->connect('/roles/add',
			[
				'controller' => 'Roles',
				'action' => 'add'
			]);
	$routes->connect('/roles/view',
			[
				'controller' => 'Roles',
				'action' => 'view'
			]);
	$routes->connect('/roles/edit',
			[
				'controller' => 'Roles',
				'action' => 'edit'
			]);
	$routes->connect('/roles/delete',
			[
				'controller' => 'Roles',
				'action' => 'delete'
			]);
	
	// Modules
	$routes->connect('/modules/lists',
			[
				'controller' => 'Modules',
				'action' => 'lists'
			]);
	$routes->connect('/modules',
			[
				'controller' => 'Modules',
				'action' => 'index'
			]);

	$routes->connect('/modules/add',
			[
				'controller' => 'Modules',
				'action' => 'add'
			]);
	$routes->connect('/modules/view',
			[
				'controller' => 'Modules',
				'action' => 'view'
			]);
	$routes->connect('/modules/edit',
			[
				'controller' => 'Modules',
				'action' => 'edit'
			]);
	$routes->connect('/modules/delete',
			[
				'controller' => 'Modules',
				'action' => 'delete'
			]);
	
	// Methods
	$routes->connect('/methods',
			[
				'controller' => 'Methods',
				'action' => 'index'
			]);

	$routes->connect('/methods/add',
			[
				'controller' => 'Methods',
				'action' => 'add'
			]);
	$routes->connect('/methods/view',
			[
				'controller' => 'Methods',
				'action' => 'view'
			]);
	$routes->connect('/methods/edit',
			[
				'controller' => 'Methods',
				'action' => 'edit'
			]);
	$routes->connect('/methods/delete',
			[
				'controller' => 'Methods',
				'action' => 'delete'
			]);

	// Permission
	$routes->connect('/permissions/add',
			[
				'controller' => 'Permissions',
				'action' => 'add'
			]);
	$routes->connect('/permissions/by_role',
			[
				'controller' => 'Permissions',
				'action' => 'getPermissionByRole'
			]);

	// Security
	$routes->connect('/securities/get_access_module',
			[
				'controller' => 'Securities',
				'action' => 'getAccessUrl'
			]);

	//pcloud
	$routes->connect('/pclouds',
			[
				'controller' => 'PClouds',
				'action' => 'index'
			]);
	$routes->connect('/pclouds/add',
			[
				'controller' => 'PClouds',
				'action' => 'add'
			]);
	$routes->connect('/pclouds/edit',
			[
				'controller' => 'PClouds',
				'action' => 'edit'
			]);
	$routes->connect('/pclouds/view',
			[
				'controller' => 'PClouds',
				'action' => 'view'
			]);
	$routes->connect('/pclouds/accounts',
			[
				'controller' => 'PClouds',
				'action' => 'accounts'
			]);
	$routes->connect('/pclouds/createfolderifnotexists',
			[
				'controller' => 'PClouds',
				'action' => 'createFolderIfNotExists'
			]);
	$routes->connect('/pclouds/renamefolder',
			[
				'controller' => 'PClouds',
				'action' => 'renameFolder'
			]);
	$routes->connect('/pclouds/deletefolder',
			[
				'controller' => 'PClouds',
				'action' => 'deleteFolder'
			]);
	$routes->connect('/pclouds/renamefile',
			[
				'controller' => 'PClouds',
				'action' => 'renameFile'
			]);
	$routes->connect('/pclouds/deletefile',
			[
				'controller' => 'PClouds',
				'action' => 'deleteFile'
			]);
	$routes->connect('/pclouds/uploadfile',
			[
				'controller' => 'PClouds',
				'action' => 'uploadFile'
			]);
	$routes->connect('/pclouds/uploadprogress',
			[
				'controller' => 'PClouds',
				'action' => 'uploadFileProgress'
			]);
	$routes->fallbacks(DashedRoute::class);
});