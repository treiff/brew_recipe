class BeersController < ApplicationController
  before_action :logged_in_user, only: [:download, :upvote, :downvote]

  def index
    @beers = Beer.all

    respond_to do |format|
      format.html
      format.json { render json: @beers }
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

  def download
    # test commit
    beer = Beer.find(params[:format])
    data = open(beer.beer_xml.url)
    send_data data.read, filename: "recipe.xml", type: "text/xml", disposition: 'attachment',
                         stream: 'true', buffer_size: '4096'
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :style, :description, :og, :fg, :abv, :beer_xml)
  end
end
