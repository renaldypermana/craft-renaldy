<?php
/**
 * Example Plugin plugin for Craft CMS 3.x
 *
 * This plugin for learn and build plugin in craft cms
 *
 * @link      github.com/renaldypermana
 * @copyright Copyright (c) 2020 Ren
 */

namespace renaldy\exampleplugin\variables;

use renaldy\exampleplugin\ExamplePlugin;

use Craft;

/**
 * Example Plugin Variable
 *
 * Craft allows plugins to provide their own template variables, accessible from
 * the {{ craft }} global variable (e.g. {{ craft.examplePlugin }}).
 *
 * https://craftcms.com/docs/plugins/variables
 *
 * @author    Ren
 * @package   ExamplePlugin
 * @since     1.0.0
 */
class ExamplePluginVariable
{
    // Public Methods
    // =========================================================================

    /**
     * Whatever you want to output to a Twig template can go into a Variable method.
     * You can have as many variable functions as you want.  From any Twig template,
     * call it like this:
     *
     *     {{ craft.examplePlugin.exampleVariable }}
     *
     * Or, if your variable requires parameters from Twig:
     *
     *     {{ craft.examplePlugin.exampleVariable(twigValue) }}
     *
     * @param null $optional
     * @return string
     */
    public function exampleVariable()
    {
        $result = "And away we go to the Twig template...";
        if ($optional) {
            $result = "I'm feeling optional today...";
        }
        return $result;
    }
}
