class Subscription < ApplicationRecord
  # join table - for the many-many between chat and user
  belongs_to :chatroom
  belongs_to :user
end
