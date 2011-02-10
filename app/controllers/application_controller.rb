class ApplicationController < ActionController::Base
  protect_from_forgery
  include Sequencescape::Api::Rails::ApplicationController
  
  def api_connection_options
    { :cookie => 'somecookie', :url => Settings.sequencescape_api_url }
  end
  
  def sequencescape_api_error_handler(exception)
    raise exception
  end
  
end
