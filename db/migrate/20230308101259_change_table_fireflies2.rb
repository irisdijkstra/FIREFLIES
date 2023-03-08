class ChangeTableFireflies2 < ActiveRecord::Migration[7.0]
  def change
    change_column :fireflies, :email_recipient, :string, default: :string
  end
end
