class AddIdentifierToChatrooms < ActiveRecord::Migration[5.1]
  def change
    add_column :chatrooms, :identifier, :string
  end
end
# this migration is going to be used to be able to uniqeuly ID the chatrooms
