class AddVotesCountToComments < ActiveRecord::Migration
  def change
    add_column :comments, :votes_count, :integer
  end
end
