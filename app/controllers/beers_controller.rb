class BeersController < ApplicationController
  before_action :logged_in_user, only: [:download, :upvote, :downvote]

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

  def download
    beer = Beer.find(params[:format])
    data = open(beer.beer_xml.url)
    send_data data.read, filename: "recipe.xml", type: "text/xml", disposition: 'attachment',
                         stream: 'true', buffer_size: '4096'
  end

  def upvote
    beer = Beer.find(params[:id])
    vote = Vote.where(beer_id: beer).first_or_create
    vote.upvote(beer)
    redirect_to :back
  end

  def downvote
    beer = Beer.find(params[:id])
    beer.downvote
    redirect_to :back
  end

  def self.vote_count
    Vote.find_by_beer_id(self).count
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :style, :description, :og, :fg, :abv, :beer_xml)
  end
end
