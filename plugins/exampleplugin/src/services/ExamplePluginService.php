<?php
/**
 * Example Plugin plugin for Craft CMS 3.x
 *
 * This plugin for learn and build plugin in craft cms
 *
 * @link      github.com/renaldypermana
 * @copyright Copyright (c) 2020 Ren
 */

namespace renaldy\exampleplugin\services;

use renaldy\exampleplugin\ExamplePlugin;

use Craft;
use craft\base\Component;

/**
 * ExamplePluginService Service
 *
 * All of your plugin’s business logic should go in services, including saving data,
 * retrieving data, etc. They provide APIs that your controllers, template variables,
 * and other plugins can interact with.
 *
 * https://craftcms.com/docs/plugins/services
 *
 * @author    Ren
 * @package   ExamplePlugin
 * @since     1.0.0
 */
class ExamplePluginService extends Component
{
    // Public Methods
    // =========================================================================

    /**
     * This function can literally be anything you want, and you can have as many service
     * functions as you want
     *
     * From any other plugin file, call it like this:
     *
     *     ExamplePlugin::$plugin->examplePluginService->exampleService()
     *
     * @return mixed
     */
    public function exampleService()
    {
        $result = 'something';

        return $result;
    }
}
