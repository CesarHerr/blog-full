class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false, limit: 100
      t.text :text, null: false
      t.string :image
      t.integer :comments_counter, default: 0, null: false
      t.integer :likes_counter, default: 0, null: false

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
