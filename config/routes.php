<?php
use Cake\Routing\RouteBuilder;
use Cake\Routing\Router;
use Cake\Routing\Route\DashedRoute;
Router::defaultRouteClass(DashedRoute::class);

Router::scope('/', function (RouteBuilder $routes) {
	// Routes for users.
	$routes->connect('/users/get_profile',
			[
				'controller' => 'Users',
				'action' => 'getProfile'
			]);
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
	$routes->fallbacks(DashedRoute::class);
});