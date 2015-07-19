class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :count
      t.references :user, index: true
      t.references :beer, index: true

      t.timestamps
    end
  end
end
