class AddSlugToChatrooms < ActiveRecord::Migration[5.1]
  def change
    add_column :chatrooms, :slug, :string
  end
end
