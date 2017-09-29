class AddUserReferenceToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :owner_id, :integer
    add_column :jobs, :freelancer_id, :integer
    
    add_foreign_key :jobs, :users, column: :owner_id
    add_foreign_key :jobs, :users, column: :freelancer_id
  end
end
