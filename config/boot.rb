KAROTZ_PROXY_ENV  = ENV['RACK_ENV'] ||= 'development' unless defined?(KAROTZ_PROXY_ENV)
KAROTZ_PROXY_ROOT = File.expand_path('../..', __FILE__) unless defined?(KAROTZ_PROXY_ROOT)

ENV['REDISTOGO_URL'] ||= 'http://localhost:6379'

$LOAD_PATH.unshift File.join(KAROTZ_PROXY_ROOT, 'lib')

require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, KAROTZ_PROXY_ENV)

require 'karotz-proxy'
