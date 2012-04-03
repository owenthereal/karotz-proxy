#!/usr/bin/env rackup

require File.expand_path("../config/boot.rb", __FILE__)
require 'sinatra'
require 'server'

run Sinatra::Application
