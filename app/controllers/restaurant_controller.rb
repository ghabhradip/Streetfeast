class RestaurantController < ApplicationController
  def new 
    @restaurant = Restaurant.new
    @address = @restaurant.addresses.build
    @menu = Menu.new
    render partial: "new"
  end

  def create
  	@restaurant = Restaurant.create(restaurant_params)
    menu_item_name = params[:menu_item_name]
    menu_item_price = params[:menu_item_price]
    restaurant_id = @restaurant.id

    menu_item_name.keys.each_with_index do |key, index|
      item_name = menu_item_name.values[index]
      item_price = menu_item_price.values[index]
      @menu = Menu.create(:item_name=>item_name,:price=>item_price,:restaurant_id=>restaurant_id)
    end

    @address = Address.create(:address_line => params[:restaurant][:address][:address_line],:latitude =>params[:restaurant][:address][:latitude],:longitude=>params[:restaurant][:address][:longitude],:restaurant_id=>@restaurant.id)
  	redirect_to :back
  end

  def show
    @restaurant = Restaurant.find_by_id(params[:id])
    @pictures_res = @restaurant.pictures
    @menu_for_restaurant = Menu.where("restaurant_id=?",@restaurant.id)
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
      @restaurant_address = Address.where("restaurant_id=?",@restaurant.id).first
      restaurant_latitude = params[:restaurant][:address][:latitude]
      restaurant_longitude = params[:restaurant][:address][:longitude]
      restaurant_address_line = params[:restaurant][:address][:address_line]
      @restaurant_address.update_attribute(:latitude,restaurant_latitude)  
      @restaurant_address.update_attribute(:longitude,restaurant_longitude)  
      @restaurant_address.update_attribute(:address_line,restaurant_address_line)
      @restaurant_address.save
      @restaurant.update_attributes(restaurant_params)
    end
    redirect_to :back      
  end

  def show_menu
    @restaurant = Restaurant.find_by_id(params[:id])
    @menu_for_restaurant = Menu.where("restaurant_id=?",@restaurant.id)
    @menu = Menu.new
    respond_to do |format|
      format.html { render :layout => false }
      format.json { render json: MenuDatatable.new(view_context) }
    end
  end



 private
  def restaurant_params
    params.require(:restaurant).permit(:name,:cuisine,:cost_for_two,:contact_number, :description,:opening_time,:closing_time,:operator,:closed_on,:associated_blogs,:is_blacklisted,:is_deactive)
  end
end