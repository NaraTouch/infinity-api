<?php
namespace App\Controller;
use App\Controller\AppController;

class WebsiteRequestsController extends AppController
{

	public function initialize()
	{
		parent::initialize();
		$this->loadModel('Components');
		$this->loadModel('Pclouds');
		$this->loadModel('Pages');
		$this->loadModel('Layouts');
		$this->loadComponent('Response');
		$this->loadComponent('Validation');
	}

	public function authorization()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			$website = $this->Response->getWebsiteByGroup($auth['group_id']);
			if ($website) {
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message, $website);
			} else {
				$http_code = 404;
				$message = 'Website Not Found!!!';
				return $this->Response->Response($http_code, $message);
			}
		}
	}

	public function webLayouts()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			$website = $this->Response->getWebsiteByGroup($auth['group_id']);
			if ($website) {
				$query = $this->Pages->find()
					->contain(['Subpages'=> function ($subpages) {
						return $subpages
								->innerJoinWith('Layouts', function($layouts) {
									return $layouts
											->contain([
												'Components' => function($component) {
												return $component
													->select([
														'Components.id',
														'Components.name',
														'Components.table_name',
														'Components.description',
														'Components.sort',
														'Components.active',
													])
													->where(['Components.active' => 1]);
										}
									]);
								})
								->contain(['Layouts' => function($con_layout) {
									return $con_layout
										->order(['Layouts.sort' => 'asc'])
										->where(['Layouts.active' => 1]);
								}])
								->order(['Subpages.sort' => 'asc'])
								->group(['Subpages.id'])
								->where(['Subpages.active' => 1]);
					}])
					->order(['Pages.sort' => 'asc'])
					->where([
						'Pages.website_id' => $website->id,
						'Pages.active' => 1
					]);
				$response = [];
				if ($query) {
					$response = $query->toArray();
				}
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message, $response);
			} else {
				$http_code = 404;
				$message = 'Website Not Found!!!';
				return $this->Response->Response($http_code, $message);
			}
		}
	}

	public function componentScripts()
	{
		if ($this->request->is('post')) {
			$auth = $this->Auth->user();
			$website = $this->Response->getWebsiteByGroup($auth['group_id']);
			if ($website) {
				$query = $this->Layouts->find()
						->distinct(['Layouts.component_id'])
						->innerJoinWith('Subpages', function($subpages) use($website) {
							return $subpages
									->innerJoinWith('Pages', function ($pages) use($website) {
										return $pages
											->where(['Pages.website_id' => $website->id]);
								});
						})
						->contain([
						'Components' => function($component) {
							return $component
								->select([
									'Components.id',
									'Components.name',
									'Components.table_name',
									'Components.description',
									'Components.sort',
									'Components.script',
									'Components.active',
								])
								->where(['Components.active' => 1]);
						}
						]);
				$response = [];
				if ($query) {
					$response = $query->toArray();
				}
				$http_code = 200;
				$message = 'Success';
				return $this->Response->Response($http_code, $message, $response);
			} else {
				$http_code = 404;
				$message = 'Not found.';
				return $this->Response->Response($http_code, $message, null, null);
			}
		}
	}
}
