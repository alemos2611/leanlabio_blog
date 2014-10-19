module Blogr
  class Subscriber < ActiveRecord::Base
    # Validations
    validates :email, presence: true
    validates_uniqueness_of :email, message: "has already been subscribed"
  end
end
