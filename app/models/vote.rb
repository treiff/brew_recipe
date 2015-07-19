# Generates votes
class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def upvote(beer_id)
    vote = Vote.find_by_beer_id(beer_id)
    vote.increment!(:count)
  end

  def downvote
    decrement!(:count)
  end

end
