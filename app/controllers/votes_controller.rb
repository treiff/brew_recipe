class VotesController < ApplicationController
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
    beer = Beer.find(params[:id])
    beer.downvote
    redirect_to :back
  end

  def self.vote_count
    Vote.find_by_beer_id(self).count
  end
end
