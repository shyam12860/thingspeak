# Load the rails application
require File.expand_path('../application', __FILE__)

Thingspeak::Application.configure do
	config.action_controller.perform_caching = true
	config.cache_store = :file_store, "#{Rails.root}/tmp/cache"

	
end

app_env_vars = File.join(Rails.root, 'config', 'initializers', 'app_env_vars.rb')
load(app_env_vars) if File.exists?(app_env_vars)

# Initialize the rails application
Thingspeak::Application.initialize!
