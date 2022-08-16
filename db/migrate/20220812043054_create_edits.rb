class CreateEdits < ActiveRecord::Migration[7.0]
  def change
    create_table :edits do |t|
      t.string :editer_name

      t.timestamps
    end
  end
end
