module Blogr
  class User < ActiveRecord::Base
    has_secure_password

    mattr_accessor :authenticate_user

    # Uploaders
    mount_uploader :avatar, AvatarUploader

    # Associations
    has_many :posts

    # Validations
    validates :name, :email, presence: true
    validates :name, uniqueness: true
    validates :email, uniqueness: true

    # methods
    def authenticate_user(pass)
      self.authenticate(pass)
    end
  end
end
