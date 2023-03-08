class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]
  # GET restaurants/
  def index
    @restaurants = Restaurant.all
  end

  # GET restaurants/
  def new
    @restaurant = Restaurant.new
  end

  # POST restaurants/:id
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity # re-renders the 'new' template
    end
  end

  # GET restaurants/:id
  def show
    @restaurant
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
