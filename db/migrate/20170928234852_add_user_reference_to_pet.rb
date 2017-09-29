class AddUserReferenceToPet < ActiveRecord::Migration[5.1]
  def change
    add_reference :pets, :users, foreign_key: true
  end
end
