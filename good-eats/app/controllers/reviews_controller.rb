class ReviewsController < ApplicationController 

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant 
  
    if @review.save
      flash[:notice] = "Review added."
      redirect_to restaurant_path(@restaurant)
    else
      flash[:alert] = "Failed to save review"
      redirect_to restaurant_path(@restaurant)
    end
  end

  protected

  def review_params
    params.require(:review).permit(:body, :rating)
  end  
end
