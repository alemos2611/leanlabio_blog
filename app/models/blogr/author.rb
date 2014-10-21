module Blogr
  class Author < ActiveRecord::Base
    has_secure_password

    # Uploaders
    mount_uploader :avatar, AvatarUploader

    # Associations
    has_many :posts

    # Validations
    validates :name, :email, presence: true
    validates :name, uniqueness: true
    validates :email, uniqueness: true
  end
end
