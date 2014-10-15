module Blogr
  class User < ActiveRecord::Base
    has_secure_password

    # Associations
    has_many :posts

    # Validations
    validates :name, :email, presence: true
    validates :name, uniqueness: true
    validates :email, uniqueness: true
  end
end
