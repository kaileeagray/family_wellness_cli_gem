require 'open-uri'
#open-uri is part of standard lib so you don't need to include it in gemspec

require 'nokogiri'
require 'pry'
require 'date'
require 'watir'


#this file acts as my environment
require_relative "./family_wellness_daily/version"
require_relative './family_wellness_daily/cli'
require_relative './family_wellness_daily/fitness_class'
require_relative './family_wellness_daily/scraper'
