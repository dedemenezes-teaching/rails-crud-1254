class RestaurantsController < ApplicationController
  # before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant, except: [:index, :new, :create]

  def index
    @restaurants = Restaurant.all
  end

  def show
    # raise
  end

  def new
    @restaurant = Restaurant.new #=> this instance is used to build the form
  end

  def create
    # raise
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to restaurants_path
  end

  def edit #=> this instance is used to build the form
  end

  def update
    # 1. retrieve the right instance
    # 2. update it
    @restaurant.update(restaurant_params)
    # 3. doesn't have a view
    redirect_to restaurant_path(@restaurant) #=> show
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
  # STRONG_PARAMS
  def restaurant_params
    # params =>{"authenticity_token"=>"[FILTERED]", "restaurant"=>{"name"=>"", "address"=>"", "rating"=>"0"}, "commit"=>"Create Restaurant"}

    params.require(:restaurant).permit(:name, :address, :rating)
  end
end
