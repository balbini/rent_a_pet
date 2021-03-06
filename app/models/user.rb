class User < ApplicationRecord
  # B/c two one-to-many relationship with the user_ID acting as the two FKs in the jobs table we had to further specify the class name and the actual name of the FK in the jobs table

  has_many :posted_jobs, :class_name => "Job", :foreign_key => "owner_id", dependent: :destroy
  has_many :working_jobs, :class_name => "Job", :foreign_key => "freelancer_id", dependent: :destroy
  # the dependent destroy is saying that when the user goes away the job goes away
  has_many :pets, dependent: :destroy
  # user has many pets - so if the user gets deleted so their pets

  # user can have many messages and many chatrooms through subscriptions since a user can have many chats
  has_many :messages, dependent: :destroy
  has_many :subscriptions
  has_many :chatrooms, through: :subscriptions

  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
  :lockable

  mount_uploader :image, ProfileUploader

  # use email address to make slug unique
  include FriendlyId
  friendly_id :first_name_and_last_name, use: [:finders, :slugged]
  # creation of the friendly_id for the urls
  def first_name_and_last_name
    "#{first_name}-#{last_name}"
  end

  def existing_chatrooms_users
    existing_chatroom_users = []
      self.chatrooms.each do |chatroom|
        existing_chatroom_users.concat(chatroom.subscriptions.where.not(user_id: self.id).map {|subscription| subscription.user})
      end
    existing_chatroom_users.uniq
  end

end
