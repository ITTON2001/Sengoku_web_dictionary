class AddEditerIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :editer_id, :integer
  end
end
