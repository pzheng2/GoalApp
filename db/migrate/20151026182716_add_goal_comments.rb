class AddGoalComments < ActiveRecord::Migration
  def change
    create_table :goal_comments do |t|
      t.text :body, null: false
      t.integer :author_id, null: false
      t.integer :goal_id, null: false, index: true

      t.timestamps
    end
  end
end
