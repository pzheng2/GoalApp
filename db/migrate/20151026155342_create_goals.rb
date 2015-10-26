class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.text :description
      t.boolean :private, null: false, default: false
      t.boolean :completed, null: false, default: false
      t.integer :user_id, null: false, index: true

      t.timestamps
    end
  end
end
