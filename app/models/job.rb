class Job < ApplicationRecord
  # we are creating a new method called owner that we can reference directly from the job to get us the ownerid.
  # b/c we have the same user_id as the same FK in the Jobs table, we had to specify the class name "User"
  # and we also had to specify the name of the FK. To do this we first had to create a new column in the migration with the new names of the FK and then add the reference to the FK.
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id", optional: true
  belongs_to :freelancer, :class_name => "User", :foreign_key => "freelancer_id", optional: true
  belongs_to :pet, optional: true
  searchkick word_start: [:title, :description, :city, :pet_breed, :status]

  def search_data
    {
      title: title,
      description: description,
      city: city,
      zip: zip,
      owner_name: owner.first_name,
      freelancer_name: freelancer.nil? ? "" : freelancer.first_name,
      pet_breed: pet.breed,
      status: status,
    }
  end
end
