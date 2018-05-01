class RestaurantController < ApplicationController
  def new 
    @restaurant = Restaurant.new
    @address = Address.new
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
  def show_user
    @restaurant = Restaurant.find_by_id(params[:id])
    @pictures_res = @restaurant.pictures
  end

  def show_pic
    @picture = Picture.find_by_id(params[:id])
    render json: {pic: @picture.avatar, id: @picture.id}
  end

  def address
    @address = Address.where("restaurant_id =?",params[:id]).first
    render json: {lat: @address.latitude,long: @address.longitude}
  end


 private
  def restaurant_params
    params.require(:restaurant).permit(:name, :description,:opening_time,:closing_time,:operator,:closed_on,:associated_blogs)
  end


end