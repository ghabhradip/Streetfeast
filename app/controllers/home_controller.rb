class HomeController < ApplicationController
  before_filter :authenticate_user!, only: [:dashboard]


  def index
  end

  def under_construction
    render layout: false
  end

  def dashboard
  	respond_to do |format|
      format.html 
      format.js   
    end
  end
  def dashboard_admin
  end
  def edit
    @user = User.find_by_id(params[:id])
  end
  def update
    @user = User.find_by_id(params[:id])
    @user.update_attributes(user_params)
    flash[:notice] = "User details updated"
    redirect_to home_dashboard_user_path
  end
  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :mobile_no,:city,:state)
  end

end
