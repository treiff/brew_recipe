class RenameVotesColumn < ActiveRecord::Migration
  def change
    rename_column :votes, :vote_count, :value
  end
end
