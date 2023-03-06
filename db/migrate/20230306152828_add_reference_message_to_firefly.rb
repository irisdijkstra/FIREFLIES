class AddReferenceMessageToFirefly < ActiveRecord::Migration[7.0]
  def change
    add_reference(:fireflies, :message, foreign_key: true)
  end
end
