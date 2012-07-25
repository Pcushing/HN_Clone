class AddVotesCountToLinks < ActiveRecord::Migration
  def change
    add_column :links, :votes_count, :integer
    add_index :links, :votes_count
  end
end
