#!/usr/bin/env rackup

APP_ENV  = ENV['RACK_ENV'] ||= 'development' unless defined?(APP_ENV)
APP_ROOT = File.expand_path(File.dirname(__FILE__)) unless defined?(APP_ROOT)

$LOAD_PATH.unshift File.join(APP_ROOT, 'lib')

require 'server'

run Sinatra::Application
