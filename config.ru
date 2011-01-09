# This file is used by Rack-based servers to start the application.

$:.unshift "/usr/jruby-bin/lib/ruby/gems/1.8/gems/bundler-1.0.7/lib"
require 'bundler/setup'

require ::File.expand_path('../config/environment',  __FILE__)
run CloudstockDemo::Application
