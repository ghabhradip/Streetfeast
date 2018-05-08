class HomeController < ApplicationController
  before_filter :authenticate_user!, only: [:dashboard]


  def index
    @blog = Blog.new
    @picture = Picture.new
    @blogs = Blog.where("is_reviewed =?",true)
  end

  def analytics
  end

  def under_construction
    render layout: false
  end

  def dummy_homepage
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
    state = params[:state]
    @user.update_attribute(:state,state)
    @user.save
    flash[:notice] = "User details updated"
    if @user.is_admin == true
      redirect_to dashboard_path
    else
      redirect_to home_dashboard_user_path
    end
  end

  
  def blog_list
    @blogs = Blog.all
    render partial: "blog_list"
  end

  def blacklist
    user_id=params[:pt]
    user=User.find(user_id.to_i)
    user.update(:is_blocked => true)

    respond_to do |format|
     format.js { render nothing: true}
    end 
  end

  def undo_blacklist
    user_id=params[:pt]
    user=User.find(user_id.to_i)
    user.update(:is_blocked => nil)

    respond_to do |format|
     format.js { render nothing: true}
    end 
  end


  def ticket_list
    @support_tickets = SupportTicket.all
  end

  def ticket_show
    @support_ticket = SupportTicket.where("id=?",params[:id]).first
    render partial: 'supportticket/show'
  end


  def subscribe
    email = params[:email]
    Subscription.create(:user_email=>email)
    render text: "success"
  end


  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :mobile_no,:city,:state)
  end

end
