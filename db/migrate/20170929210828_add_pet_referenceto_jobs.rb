class AddPetReferencetoJobs < ActiveRecord::Migration[5.1]
  def change
    add_reference :jobs, :pet, foreign_key: true
  end
end
