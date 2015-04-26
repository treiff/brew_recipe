class BeersController < ApplicationController
  before_action :logged_in_user, only: [:index]

  def index
    @beers = Beer.all
  end

  def new
    @beer = Beer.new
  end

  def create
    user = current_user
    beer = current_user.beers.build(beer_params)
    if beer.save
      redirect_to action: 'index'
    end
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :style, :description, :og, :fg, :abv, :beer_xml)
  end
end
