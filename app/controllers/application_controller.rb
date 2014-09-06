class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  check_authorization unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    if current_user
      redirect_to root_path, :alert => exception.message
    else
      redirect_to new_user_session_path, :alert => "Please sign in"
    end
  end

private

  def render_invalid obj
    render json: { errors: obj.errors.full_messages }, status: 422
  end

end
