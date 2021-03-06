<?php
namespace App;

use Cake\Core\Configure;
use Cake\Core\Exception\MissingPluginException;
use Cake\Error\Middleware\ErrorHandlerMiddleware;
use Cake\Http\BaseApplication;
use Cake\Routing\Middleware\AssetMiddleware;
use Cake\Routing\Middleware\RoutingMiddleware;
class Application extends BaseApplication
{
	public function bootstrap()
	{
		$this->addPlugin('ADmad/JwtAuth');
		parent::bootstrap();

		if (PHP_SAPI === 'cli') {
			$this->bootstrapCli();
		}
		if (Configure::read('debug')) {
			$this->addPlugin(\DebugKit\Plugin::class);
		}

	}
	public function middleware($middlewareQueue)
	{
		$middlewareQueue
			->add(new ErrorHandlerMiddleware(null, Configure::read('Error')))
			->add(new AssetMiddleware([
				'cacheTime' => Configure::read('Asset.cacheTime')
			]))
			->add(new RoutingMiddleware($this));

		return $middlewareQueue;
	}

	protected function bootstrapCli()
	{
		try {
			$this->addPlugin('Bake');
		} catch (MissingPluginException $e) {
		}
		$this->addPlugin('Migrations');
	}
}
