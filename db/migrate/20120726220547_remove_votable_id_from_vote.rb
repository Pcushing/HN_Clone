class RemoveVotableIdFromVote < ActiveRecord::Migration
  def up
    remove_column :votes, :votable_id
  end

  def down
    add_column :votes, :votable_id, :integer
  end
end
