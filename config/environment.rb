# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
CloudstockDemo::Application.initialize!

require 'java'
java.lang.System.set_property("java.awt.headless", "true")
