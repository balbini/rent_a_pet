class RemoveTopicFromChatroom < ActiveRecord::Migration[5.1]
  def change
    remove_column :chatrooms, :topic
  end
end
