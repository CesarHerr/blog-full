class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 50
      t.string :username, null: false, limit: 50
      t.string :photo
      t.string :bio, limit: 500
      t.string :country
      t.integer :post_counter, default: 0, null: false

      t.timestamps
    end
  end
end
