class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.page(params[:page]).per(10)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
     @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = 'Restaurant added.'
      redirect_to restaurants_path
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
    @review = Review.new
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    flash[:notice] = "Restaurant was removed"
    redirect_to restaurants_path
  end

  protected

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zipcode, :description, :category)
  end 
end
