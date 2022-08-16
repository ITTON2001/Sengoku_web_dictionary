class AddEditTextToEdits < ActiveRecord::Migration[7.0]
  def change
    add_column  :edits, :edit_text,  :text
  end
end
