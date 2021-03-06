class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Authorization
  rescue_from CanCan::AccessDenied do |exception|

  	# RSpec functional Tests
  	# redirect_to main_app.root_url, alert: exception.message
  	redirect_to new_user_session_path, alert: exception.message
  end

end
