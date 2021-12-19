# name: Discourse geogebra Onebox
# about: Adds support for embedding geogebra calculators within Discourse.
# version: 0.1
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
        "<iframe name='embed_readwrite' src='https://www.geogebra.org/calculator/#{id}?embed' width='800' height='600'"\
        " allowfullscreen style='border: 1px solid #e4e4e4;border-radius: 4px; transform: scale(0.5);' frameborder='0'></iframe>"
	end
end