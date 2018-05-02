class RestaurantController < ApplicationController
  def new 
    @restaurant = Restaurant.new
    @address = @restaurant.addresses.build
    render partial: "new"
  end

  def create
  	@restaurant = Restaurant.create(restaurant_params)
    @address = Address.create(:address_line => params[:restaurant][:address][:address_line],:latitude =>params[:restaurant][:address][:latitude],:longitude=>params[:restaurant][:address][:longitude],:restaurant_id=>@restaurant.id)
  	redirect_to :back
  end

  def show
    @restaurant = Restaurant.find_by_id(params[:id])
    @pictures_res = @restaurant.pictures
  end


  def show_for_user
    @restaurant = Restaurant.find_by_id(params[:id])
    @pictures_res = @restaurant.pictures
  end

  def show_pic
    @picture = Picture.find_by_id(params[:id])
    if current_user.present?
      @like = Like.where("picture_id=?  and user_id =? and is_liked =?",@picture.id,current_user.id,true).first
    end
    if @like.present?
      render json: {pic: @picture.avatar, id: @picture.id, is_liked: true}
    else
      render json: {pic: @picture.avatar, id: @picture.id, is_liked: false}
    end
  end

  def address
    @address = Address.where("restaurant_id =?",params[:id]).first
    render json: {lat: @address.latitude,long: @address.longitude}
  end
  def update
    @restaurant = Restaurant.find_by_id(params[:id])
    if @restaurant.present?
      #@restaurant_address = Address.where("restaurant_id=?",@restaurant.id).first
      # restaurant_latitude = params[:restaurant][:address][:latitude]
      # restaurant_longitude = params[:restaurant][:address][:longitude]
      # restaurant_address_line = params[:restaurant][:address][:address_line]
      # #@restaurant_address.update_attributes(:latitude=>restaurant_latitude)  
      @restaurant.update_attributes(restaurant_params)
      @restaurant.save
    end
    redirect_to :back      
  end



 private
  def restaurant_params
    params.require(:restaurant).permit(:name,:contact_number, :description,:opening_time,:closing_time,:operator,:closed_on,:associated_blogs ,:addresses=>[:address_line,:longitude,:latitude])
  end


end