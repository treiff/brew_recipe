class BeersController < ApplicationController
  before_action :logged_in_user, only: [:index]

  def index
    @beers = Beer.all
  end
end
