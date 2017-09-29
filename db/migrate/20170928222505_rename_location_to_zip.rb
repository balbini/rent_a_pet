class RenameLocationToZip < ActiveRecord::Migration[5.1]
  def change
    rename_column :jobs, :location, :zip
    add_column :jobs, :address, :string
    add_column :jobs, :city, :string
    add_column :jobs, :state, :string
    remove_column :users, :roles
  end
end
