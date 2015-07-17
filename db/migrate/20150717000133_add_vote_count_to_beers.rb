class AddVoteCountToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :vote_count, :integer, :null => false, :default => 0
  end
end
