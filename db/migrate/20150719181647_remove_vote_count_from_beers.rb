class RemoveVoteCountFromBeers < ActiveRecord::Migration
  def change
    remove_column :beers, :vote_count
  end
end
