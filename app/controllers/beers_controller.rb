class BeersController < ApplicationController
#  before_action :logged_in_user, only: [:index]

  def index
    if params[:q].present?
      @beers = Beer.search(params[:q])
    else
      @beers = Beer.all
    end
  end

  def new
    @beer = Beer.new
  end

  def create
    beer = current_user.beers.build(beer_params)
    if beer.save
      redirect_to action: 'index'
    else
      flash.now[:error] = "unable to save record"
    end
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :style, :description, :og, :fg, :abv, :beer_xml)
  end
end
