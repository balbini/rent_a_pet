class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
  :lockable

  include FriendlyId
  friendly_id :first_name_and_last_name, use: [:finders, :slugged]
  # creation of the friendly_id for the urls
  def first_name_and_last_name
    "#{first_name}-#{last_name}"
  end

end
