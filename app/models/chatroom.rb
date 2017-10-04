class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  # has_many :users,
  has_many :users, through: :subscriptions
  has_many :subscriptions, dependent: :destroy
  # validates :topic, presence: true, uniqueness: true, case_sensitive: false

  # include FriendlyId
  # friendly_id :topic, use: [:finders, :slugged]
  # def topic
  #   "#{topic}"
  # end

end
