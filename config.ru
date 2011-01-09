# This file is used by Rack-based servers to start the application.

# Find the latest bundler and get started
require 'rbconfig'
$:.unshift(Dir.glob[RbConfig["libdir"] + "/ruby/gems/1.8/gems/bundler-*/lib"].sort.last)
require 'bundler/setup'

require ::File.expand_path('../config/environment',  __FILE__)
run CloudstockDemo::Application
