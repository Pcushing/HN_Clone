class FixLinkId < ActiveRecord::Migration
  def up
    rename_column :votes, :link_id, :votable_id
  end

  def down
  end
end
