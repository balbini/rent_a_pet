class AddAboutmeToPet < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :about_me, :string
  end
end
