<?php
use Cake\Routing\RouteBuilder;
use Cake\Routing\Router;
use Cake\Routing\Route\DashedRoute;
Router::defaultRouteClass(DashedRoute::class);

Router::scope('/', function (RouteBuilder $routes) {
	$routes->connect('/user/get_profile',
			[
				'controller' => 'Users',
				'action' => 'getProfile'
			]);
	$routes->connect('/user/login',
			[
				'controller' => 'Users',
				'action' => 'login'
			]);
	$routes->connect('/user',
			[
				'controller' => 'Users',
				'action' => 'index'
			]);
	$routes->connect('/user/view/:id',
			[
				'controller' => 'Users',
				'action' => 'view'
			],
			[
				'pass' => ['id']
			]);
	$routes->connect('/user/add',
			[
				'controller' => 'Users',
				'action' => 'add'
			]);
	$routes->fallbacks(DashedRoute::class);
});