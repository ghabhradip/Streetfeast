class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def test_email
  	UserMailer.send_email("test").deliver
  	render text:"success"
  end

  protected

    def configure_permitted_parameters
        # Fields for sign up
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstname, :lastname, :email, :password, :mobile_no, :city, :state) }
    end

    def after_sign_in_path_for(resource)
      	dashboard_path
    end

    def after_sign_up_path_for(resource)
      	dashboard_path
    end
end
