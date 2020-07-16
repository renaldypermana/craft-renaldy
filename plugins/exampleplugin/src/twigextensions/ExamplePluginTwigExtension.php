<?php
/**
 * Example Plugin plugin for Craft CMS 3.x
 *
 * This plugin for learn and build plugin in craft cms
 *
 * @link      github.com/renaldypermana
 * @copyright Copyright (c) 2020 Ren
 */

namespace renaldy\exampleplugin\twigextensions;

use renaldy\exampleplugin\ExamplePlugin;

use Craft;

use Twig\Extension\AbstractExtension;
use Twig\TwigFilter;
use Twig\TwigFunction;

/**
 * Twig can be extended in many ways; you can add extra tags, filters, tests, operators,
 * global variables, and functions. You can even extend the parser itself with
 * node visitors.
 *
 * http://twig.sensiolabs.org/doc/advanced.html
 *
 * @author    Ren
 * @package   ExamplePlugin
 * @since     1.0.0
 */
class ExamplePluginTwigExtension extends AbstractExtension
{
    // Public Methods
    // =========================================================================

    /**
     * Returns the name of the extension.
     *
     * @return string The extension name
     */
    public function getName()
    {
        return 'ExamplePlugin';
    }

    /**
     * Returns an array of Twig filters, used in Twig templates via:
     *
     *      {{ 'something' | someFilter }}
     *
     * @return array
     */
    public function getFilters()
    {
        return [
            new TwigFilter('someFilter', [$this, 'someInternalFunction']),
             new TwigFilter('formatDateIndo', [$this, 'formatDateIndo']),
        ];
    }

    /**
     * Returns an array of Twig functions, used in Twig templates via:
     *
     *      {% set this = someFunction('something') %}
     *
    * @return array
     */
    public function getFunctions()
    {
        return [
            new TwigFunction('someFunction', [$this, 'someInternalFunction']),
        ];
    }

    /**
     * Our function called via Twig; it can do anything you want
     *
     * @param null $text
     *
     * @return string
     */
    public function someInternalFunction($text = null)
    {
        $result = $text . " in the way";

        return $result;
    }

    public function formatDateIndo($date)
    {
        $bulan = array (
            1 =>   'Januari',
            'Februari',
            'Maret',
            'April',
            'Mei',
            'Juni',
            'Juli',
            'Agustus',
            'September',
            'Oktober',
            'November',
            'Desember'
        );
        $tanggal = explode('-', $date);
        $tanggal[1] = date("m", mktime(0, 0, 0, $tanggal[1], 10));
        $result = $tanggal[2].' '.$bulan[(int) $tanggal[1]].' '.$tanggal[0];
        return $result;
    }
}
