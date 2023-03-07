class AddEmailRecieveToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :email_to, :string, array: true, default: []
  end
end
