class RegistrationsController < Devise::RegistrationsController
  # Required so that authenticated users can access this page
  # instead of being redirected to new_user_session_path
  skip_before_action :require_no_authentication

  def new
    redirect_to root_path
  end
end