class AddUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.text :body, null: false
      t.integer :author_id, null: false
      t.integer :user_id, null: false, index: true

      t.timestamps, null: false
    end
  end
end
