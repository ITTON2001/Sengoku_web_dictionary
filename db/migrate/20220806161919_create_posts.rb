class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :post_name
      t.text :mini_content
      t.text :content
      t.integer :user_id
      t.integer :map_id


      t.timestamps
    end
  end
end
