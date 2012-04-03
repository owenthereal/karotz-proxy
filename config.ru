#!/usr/bin/env rackup

require 'config/boot'
require 'sinatra'
require 'karotz-proxy'
require 'server'

run Sinatra::Application
