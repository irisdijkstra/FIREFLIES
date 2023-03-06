class CreateFireflies < ActiveRecord::Migration[7.0]
  def change
    create_table :fireflies do |t|
      t.date :date_sent
      t.date :date_recieve
      t.string :email_recipient

      t.timestamps
    end
  end
end
