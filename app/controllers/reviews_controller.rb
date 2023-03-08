class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[new create]
  # GET "restaurants/:restaurant_id/reviews/new"
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  # Post "restaurants/:restaurant_id/reviews"
  def create
    @review = Review.new(reviews_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE "restaurants/:restaurant_id/reviews/:id"
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def reviews_params
    params.require(:review).permit(:rating, :content, :restaurant_id)
  end
end
