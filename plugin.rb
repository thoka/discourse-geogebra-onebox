# name: Discourse geogebra Onebox
# about: Adds support for embedding geogebra calculators within Discourse.
# version: 0.0.2
# authors: Thomas Kalka
# url: https://github.com/thoka/discourse-geogebra-onebox

require "onebox"

class Onebox::Engine::GeogebraOnebox
	include Onebox::Engine

	REGEX = /^https?:\/\/www\.geogebra\.org\/calculator\/(\w+)/
	matches_regexp REGEX

	def id
		@url.match(REGEX)[1]
	end
	
	def to_html
        # For iframe parameters see https://wiki.geogebra.org/en/Reference:Material_Embedding_(Iframe)
        "<div style='left: 0; width: 100%; height: 0; position: relative; padding-bottom: 63.0354%;'>"\
        "<iframe src='https://www.geogebra.org/material/iframe/id/#{id}/sfsb/true/width/1200/height/760/szb/true/rc/true/sdz/true/sri/true/ai/true' "\
        "style='top: 0; left: 0; width: 100%; height: 100%; position: absolute; border: 0;' allowfullscreen>"\
        "</iframe></div>"
	end
end