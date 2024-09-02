class AddChatroomToMessages < ActiveRecord::Migration[7.1]
  def change
    add_reference :messages, :chatroom, null: true, foreign_key: true
  end
end
