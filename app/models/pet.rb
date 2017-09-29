class Pet < ApplicationRecord
  belongs_to :user, dependent: :destroy, optional: true
end
