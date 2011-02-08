class ApplicationController < ActionController::Base
  protect_from_forgery
  include Sequencescape::Api::Rails::ApplicationController
  
  def extra_options
    { :cookie => 'somecookie', :url => Settings.sequencescape_api_url }
  end
  
end
