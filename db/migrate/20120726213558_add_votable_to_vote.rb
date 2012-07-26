class AddVotableToVote < ActiveRecord::Migration
  def change
    add_column :votes, :votable_type, :string, :default => "Link"
    add_column :votes, :votable_id, :integer
  end
end
