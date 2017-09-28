class Pet < ApplicationRecord
  belongs :owner, dependent: :destroy
end
