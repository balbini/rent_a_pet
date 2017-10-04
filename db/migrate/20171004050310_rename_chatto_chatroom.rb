class RenameChattoChatroom < ActiveRecord::Migration[5.1]
  def change
    rename_column :subscriptions, :chat_id, :chatroom_id
  end
end
