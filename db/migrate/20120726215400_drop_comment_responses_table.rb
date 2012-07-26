class DropCommentResponsesTable < ActiveRecord::Migration
  def up
    drop_table :comment_responses
  end

  def down
  end
end
