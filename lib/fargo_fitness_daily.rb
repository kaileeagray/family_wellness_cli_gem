require 'open-uri'
#open-uri is part of standard lib so you don't need to include it in gemspec

require 'nokogiri'
require 'pry'
require 'date'
require 'watir'

#this file acts as my environment
require_relative "./fargo_fitness_daily/version"
require_relative './fargo_fitness_daily/cli'
require_relative './fargo_fitness_daily/fitness_class'
require_relative './fargo_fitness_daily/scraper'
