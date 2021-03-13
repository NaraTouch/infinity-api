<?php
use Cake\Routing\RouteBuilder;
use Cake\Routing\Router;
use Cake\Routing\Route\DashedRoute;
Router::defaultRouteClass(DashedRoute::class);

Router::scope('/', function (RouteBuilder $routes) {
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
	$routes->connect('/users/view/:id',
			[
				'controller' => 'Users',
				'action' => 'view'
			],
			[
				'pass' => ['id']
			]);
	$routes->connect('/users/add',
			[
				'controller' => 'Users',
				'action' => 'add'
			]);
	$routes->fallbacks(DashedRoute::class);
});