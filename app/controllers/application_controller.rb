class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
  redirect_to main_app.root_url, :alert => exception.message
 end
	# saves the location before loading each page so we can return to the
	# right page. If we're on a devise page, we don't want to store that as the
	# place to return to (for example, we don't want to return to the sign in page
	# after signing in), which is what the :unless prevents
	before_action :store_current_location, :unless => :devise_controller?
	
	private
	# override the devise helper to store the current location so we can
	# redirect to it after loggin in or out. This override makes signing in
	# and signing up work automatically.
	def store_current_location
	store_location_for(:user, request.url)
	end
	private
  # override the devise method for where to go after signing out because theirs
  # always goes to the root path. Because devise uses a session variable and
  # the session is destroyed on log out, we need to use request.referrer
  # root_path is there as a backup
  def after_sign_out_path_for(resource)
    request.referrer || root_path
  end





		 
end
