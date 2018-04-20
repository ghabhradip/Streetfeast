class BlogController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @blog  = Blog.create(blog_params)
    if params[:blog][:picture].nil?
      redirect_to :back
    else
      params[:blog][:picture][:avatar].each do |c|
        Picture.create(:avatar=> c,:blog_id => @blog.id)
        redirect_to :back
      end
    end
  end

  def new
    @blog = Blog.new
    @picture = Picture.new
  end

  def create_blog_user
    @blog  = Blog.create(blog_params)
    @blog.user_id = current_user.id
    @blog.save
    unless params[:blog][:picture].nil?
      params[:blog][:picture][:avatar].each do |c|
        Picture.create(:avatar=> c,:blog_id => @blog.id,:user_id => current_user.id)
      end
    end
    if current_user.is_admin == true
      redirect_to dashboard_path
    else
      redirect_to home_dashboard_user_path
    end
  end

  def edit
    @blog = Blog.find_by_id(params[:id])
    @picture = Picture.new
    render partial: "edit"
  end

  def update
    @blog = Blog.find_by_id(params[:id])
    @blog.update_attributes(blog_params)
    render json: @blog
  end

  def add_picture_to_blog
    picture = params[:pic].to_jsons
    render text: "uploaded"
  end

  private
  
  def blog_params
    params.require(:blog).permit(:title, :content,:email,:fullname)
  end
end
