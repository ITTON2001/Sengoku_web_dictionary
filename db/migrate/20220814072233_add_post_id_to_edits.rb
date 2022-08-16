class AddPostIdToEdits < ActiveRecord::Migration[7.0]
  def change
    add_column :edits, :post_id, :integer
  end
end
