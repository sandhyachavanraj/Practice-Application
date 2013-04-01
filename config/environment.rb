# Load the rails application
require File.expand_path('../application', __FILE__)
require 'contacts'
# Initialize the rails application
PracticeApp::Application.initialize!

# Rails::Initializer.run do |config|
#   config.active_record.observers = :notification_observer
# end