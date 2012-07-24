class AddLinkIdToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :link_id, :integer
    add_index :votes, :link_id
  end
end
