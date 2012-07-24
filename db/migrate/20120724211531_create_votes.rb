class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :up
      t.boolean :down
      t.integer :user_id

      t.timestamps
    end
  end
end
