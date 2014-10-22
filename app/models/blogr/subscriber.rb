module Blogr
  class Subscriber < ActiveRecord::Base
    # Callbacks
    after_create :subscribe_to_mailchimp

    # Validations
    validates :email, presence: true
    validates_uniqueness_of :email, message: "has already been subscribed"

    # Methods
    def subscribe_to_mailchimp
      list_id = "abd11f7353" # Startup Ideas Blog list on mailchimp
      response = Rails.configuration.mailchimp.lists.subscribe({ :id => list_id, :email => { :email => email }, :merge_vars => { :SOURCE => "blog" }, :double_optin => false })
      response
    end
  end
end
