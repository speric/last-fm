last-fm
============

*Wrapper class for parsing last.fm XML feeds*

In addition to it's API, Last.fm offers two XML feeds, one for top artists (overall, or for the last 3/6/9/12 months), and a weekly artist chart.  This plugin makes parsing those feeds a little easier. 

**Required gems**

* rexml

**Install**
	
	git submodule add git://github.com/speric/last-fm.git vendor/plugins/last-fm

**Use**

	last_fm = LastFm.new("ericfarkas") #initialize with your last.fm username
	
	#top artists overall
	top_artists = last_fm.topartists
	top_artists.first.name
	=> "Thrice"
	top_artists.first.playcount
	=> "2600"
	top_artists.first.url
	=> "http://www.last.fm/music/Thrice"

	# top artists for the last 3 months	
	top_artists = last_fm.topartists(3)

	# top artists for the last 6 months
	top_artists = last_fm.topartists(6)

	# latest weekly artist chart	
	weekly = last_fm.weeklyartistchart

Each method returns an Array of `Artist` objects, which each have a `name`, `playcount`, and `url` properties.


The topartists feed from last.fm only recognizes 3, 6, 9, and 12 months as parameters.  Anything else will return top artists overall.

**TODO**

* Also include URLs for images in Artist object