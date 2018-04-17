class BlogController < ApplicationController
  def create
    @blog  = Blog.create(blog_params)
    params[:blog][:picture][:avatar].each do |c|
      Picture.create(:avatar=> c,:blog_id => @blog.id)
    end
    redirect_to :back
  end
  def new
    @blog = Blog.new
    @picture = Picture.new
  end

  def create_blog_user
    @blog  = Blog.create(blog_params)
    @blog.author_id = current_user.id
    @blog.save
    params[:blog][:picture][:avatar].each do |c|
      Picture.create(:avatar=> c,:blog_id => @blog.id,:user_id => current_user.id)
    end
    if current_user.is_admin == true
      redirect_to dashboard_path 
    else
      redirect_to home_dashboard_user_path
    end
  end


  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

end
