class RenameCountInBeers < ActiveRecord::Migration
  def change
    rename_column :votes, :count, :vote_count
  end
end
