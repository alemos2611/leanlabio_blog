module Blogr
  class User < ActiveRecord::Base
    has_secure_password

    validates :name, :email, presence: true
    validates :name, uniqueness: true
    validates :email, uniqueness: true
  end
end
