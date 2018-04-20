class UserController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    @user = User.find(params[:id]) 
    @picture = Picture.new
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.update_attributes(user_params)
    state = params[:state]
    @user.update_attribute(:state,state)
    @user.save
    if params[:user][:picture].present?
      if @user.picture.present?
        image = params[:user][:picture][:avatar]
        @user.picture.update_attribute(:avatar,image)
      else
        image = params[:user][:picture][:avatar]
        @picture = Picture.create(:avatar =>image,:user_id => @user.id)
      end
    else
      @picture = Picture.create(:user_id => @user.id)
    end
    flash[:notice] = "User details updated"
    redirect_to :back
  end



  def photo_remove
    @user = User.find_by_id(params[:id])
    @image = @user.picture
    @image.destroy
    render text: "success"
  end


  private
    def user_params
      params.require(:user).permit(:firstname, :lastname, :mobile_no,:city,:state)
    end
end
