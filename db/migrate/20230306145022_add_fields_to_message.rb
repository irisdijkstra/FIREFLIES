class AddFieldsToMessage < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :letter, :text
    add_column :messages, :image, :string
    add_column :messages, :video, :string
    add_column :messages, :audio, :string
  end
end
