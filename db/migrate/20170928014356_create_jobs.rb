class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.string :location
      t.date :begin_date
      t.date :end_date
      t.integer :dollar_value
      t.string :type_of_job
      t.string :status
      t.string :recurring
      t.string :pet_location
      t.date :expiration_date

      t.timestamps
    end
  end
end
