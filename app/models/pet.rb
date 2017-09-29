class Pet < ApplicationRecord
  belongs_to :owner, dependent: :destroy
end
