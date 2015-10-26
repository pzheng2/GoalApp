class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :author_id, null: false, index: true
      t.integer :commentable_id, null: false, index: true
      t.string :commentable_type, null: false, index: true

      t.timestamps
    end
  end
end
