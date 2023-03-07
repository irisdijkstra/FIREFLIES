class ChangeRecipientInMessage < ActiveRecord::Migration[7.0]
  def change
    change_column :fireflies, :email_recipient, :string, array: true, default: [], using: "(string_to_array(email_recipient, ','))"
  end
end
