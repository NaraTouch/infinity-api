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
	// AWS (S3)
	$routes->connect('/aws',
			[
				'controller' => 'AWS',
				'action' => 'index'
			]);
	$routes->connect('/aws/add',
			[
				'controller' => 'AWS',
				'action' => 'add'
			]);
	$routes->connect('/aws/edit',
			[
				'controller' => 'AWS',
				'action' => 'edit'
			]);
	$routes->connect('/aws/view',
			[
				'controller' => 'AWS',
				'action' => 'view'
			]);
	$routes->connect('/aws/accounts',
			[
				'controller' => 'AWS',
				'action' => 'accounts'
			]);
	$routes->connect('/aws/createfolder',
			[
				'controller' => 'AWS',
				'action' => 'createFolder'
			]);
	$routes->connect('/aws/renamefolder',
			[
				'controller' => 'AWS',
				'action' => 'renameFolder'
			]);
	$routes->connect('/aws/deletefolder',
			[
				'controller' => 'AWS',
				'action' => 'deleteFolder'
			]);
	$routes->connect('/aws/renamefile',
			[
				'controller' => 'AWS',
				'action' => 'renameFile'
			]);
	$routes->connect('/aws/deletefile',
			[
				'controller' => 'AWS',
				'action' => 'deleteFile'
			]);
	$routes->connect('/aws/uploadfile',
			[
				'controller' => 'AWS',
				'action' => 'uploadFile'
			]);
	$routes->connect('/aws/policy',
			[
				'controller' => 'AWS',
				'action' => 'uploadFileProgress'
			]);

	// Templates
	$routes->connect('/templates',
			[
				'controller' => 'Templates',
				'action' => 'index'
			]);

	$routes->connect('/templates/add',
			[
				'controller' => 'Templates',
				'action' => 'add'
			]);
	$routes->connect('/templates/view',
			[
				'controller' => 'Templates',
				'action' => 'view'
			]);
	$routes->connect('/templates/edit',
			[
				'controller' => 'Templates',
				'action' => 'edit'
			]);
	$routes->connect('/templates/delete',
			[
				'controller' => 'Templates',
				'action' => 'delete'
			]);
	
	// Applications
	$routes->connect('/applications',
			[
				'controller' => 'Applications',
				'action' => 'index'
			]);
	$routes->connect('/applications/add',
			[
				'controller' => 'Applications',
				'action' => 'add'
			]);
	$routes->connect('/applications/view',
			[
				'controller' => 'Applications',
				'action' => 'view'
			]);
	$routes->connect('/applications/edit',
			[
				'controller' => 'Applications',
				'action' => 'edit'
			]);
	$routes->connect('/applications/delete',
			[
				'controller' => 'Applications',
				'action' => 'delete'
			]);
	
	// Components
	$routes->connect('/components',
			[
				'controller' => 'Components',
				'action' => 'index'
			]);
	$routes->connect('/components/add',
			[
				'controller' => 'Components',
				'action' => 'add'
			]);
	$routes->connect('/components/view',
			[
				'controller' => 'Components',
				'action' => 'view'
			]);
	$routes->connect('/components/edit',
			[
				'controller' => 'Components',
				'action' => 'edit'
			]);
	$routes->connect('/components/delete',
			[
				'controller' => 'Components',
				'action' => 'delete'
			]);
	
	// Pages
	$routes->connect('/pages',
			[
				'controller' => 'IPages',
				'action' => 'index'
			]);
	$routes->connect('/pages/add',
			[
				'controller' => 'IPages',
				'action' => 'add'
			]);
	$routes->connect('/pages/view',
			[
				'controller' => 'IPages',
				'action' => 'view'
			]);
	$routes->connect('/pages/edit',
			[
				'controller' => 'IPages',
				'action' => 'edit'
			]);
	$routes->connect('/pages/delete',
			[
				'controller' => 'IPages',
				'action' => 'delete'
			]);
	
	// Subpages
	$routes->connect('/subpages',
			[
				'controller' => 'Subpages',
				'action' => 'index'
			]);
	$routes->connect('/subpages/add',
			[
				'controller' => 'Subpages',
				'action' => 'add'
			]);
	$routes->connect('/subpages/view',
			[
				'controller' => 'Subpages',
				'action' => 'view'
			]);
	$routes->connect('/subpages/edit',
			[
				'controller' => 'Subpages',
				'action' => 'edit'
			]);
	$routes->connect('/subpages/delete',
			[
				'controller' => 'Subpages',
				'action' => 'delete'
			]);

	// Layouts
	$routes->connect('/layouts',
			[
				'controller' => 'Layouts',
				'action' => 'index'
			]);
	$routes->connect('/layouts/add',
			[
				'controller' => 'Layouts',
				'action' => 'add'
			]);
	$routes->connect('/layouts/view',
			[
				'controller' => 'Layouts',
				'action' => 'view'
			]);
	$routes->connect('/layouts/edit',
			[
				'controller' => 'Layouts',
				'action' => 'edit'
			]);
	$routes->connect('/layouts/delete',
			[
				'controller' => 'Layouts',
				'action' => 'delete'
			]);
	
	// Local File Managers
	$routes->connect('/local-file-managers',
			[
				'controller' => 'LocalFileManagers',
				'action' => 'index'
			]);

	$routes->connect('/local-file-managers/add',
			[
				'controller' => 'LocalFileManagers',
				'action' => 'add'
			]);
	$routes->connect('/local-file-managers/view',
			[
				'controller' => 'LocalFileManagers',
				'action' => 'view'
			]);
	$routes->connect('/local-file-managers/edit',
			[
				'controller' => 'LocalFileManagers',
				'action' => 'edit'
			]);
	$routes->connect('/local-file-managers/delete',
			[
				'controller' => 'LocalFileManagers',
				'action' => 'delete'
			]);

	// Website Requests
	$routes->connect('/websites/authorization',
			[
				'controller' => 'WebsiteRequests',
				'action' => 'authorization'
			]);
	
	$routes->connect('/websites/weblayouts',
			[
				'controller' => 'WebsiteRequests',
				'action' => 'webLayouts'
			]);
	$routes->connect('/websites/component-scripts',
			[
				'controller' => 'WebsiteRequests',
				'action' => 'componentScripts'
			]);

	/// GG Game template
	//  GGMainSliders
	$routes->connect('/ggmainsliders',
			[
				'controller' => 'GGMainSliders',
				'action' => 'index'
			]);
	$routes->connect('/ggmainsliders/add',
			[
				'controller' => 'GGMainSliders',
				'action' => 'add'
			]);
	$routes->connect('/ggmainsliders/view',
			[
				'controller' => 'GGMainSliders',
				'action' => 'view'
			]);
	$routes->connect('/ggmainsliders/edit',
			[
				'controller' => 'GGMainSliders',
				'action' => 'edit'
			]);
	$routes->connect('/ggmainsliders/delete',
			[
				'controller' => 'GGMainSliders',
				'action' => 'delete'
			]);
	//  GGCategories
	$routes->connect('/ggcategories',
			[
				'controller' => 'GGCategories',
				'action' => 'index'
			]);
	$routes->connect('/ggcategories/add',
			[
				'controller' => 'GGCategories',
				'action' => 'add'
			]);
	$routes->connect('/ggcategories/view',
			[
				'controller' => 'GGCategories',
				'action' => 'view'
			]);
	$routes->connect('/ggcategories/edit',
			[
				'controller' => 'GGCategories',
				'action' => 'edit'
			]);
	$routes->connect('/ggcategories/delete',
			[
				'controller' => 'GGCategories',
				'action' => 'delete'
			]);
	
	// Start front end request 
	$routes->connect('/front-end',
			[
				'controller' => 'FrontEndRequests',
				'action' => 'frontEnd'
			]);
	
	$routes->fallbacks(DashedRoute::class);
});