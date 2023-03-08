class ChangeTableFireflies < ActiveRecord::Migration[7.0]
  def change
    change_column :fireflies, :email_recipient, :string
  end
end
