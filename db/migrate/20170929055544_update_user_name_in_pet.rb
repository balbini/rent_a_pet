class UpdateUserNameInPet < ActiveRecord::Migration[5.1]
  def change
    rename_column :pets, :users_id, :user_id
  end
end
