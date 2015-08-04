class VotesController < ApplicationController
  before_action :logged_in_user

  def upvote
    @beer = Beer.find(params[:beer_id])
    @vote = @beer.votes.where(user_id: current_user.id).first
    if @vote # if it exists, update it
      @vote.update_attribute(:value, 1)
    else # create it
      @vote = current_user.votes.create(value: 1, beer_id: @beer.id)
    end
    redirect_to :back
  end

  def downvote
    @beer = Beer.find(params[:beer_id])
    @vote = @beer.votes.where(user_id: current_user.id).first
    if @vote # if it exists, update it
      @vote.update_attribute(:value, -1)
    else # create it
      @vote = current_user.votes.create(value: -1, beer_id: @beer.id)
    end
    redirect_to :back
  end

  private

  def logged_in_user
    return true if logged_in?
    flash[:danger] = "Please login to vote"
    redirect_to beers_path
  end
end
