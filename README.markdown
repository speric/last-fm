google-define
============

*Get word definitions from Google*

**Required gems**

* hpricot

**Install**
	git submodule add git://github.com/speric/google-define.git vendor/plugins/google-define

**Use**
	GoogleDefine::define("tasty")

Returns an Array of the `<li>` elements from [http://www.google.com/search?q=define%3Atasty](http://www.google.com/search?q=define%3Atasty), with the HTML stripped (except for quotings).  If there are no definitions for the word given, an empty Array will be returned.

