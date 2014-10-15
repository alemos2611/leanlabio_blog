module Blogr
  class Post < ActiveRecord::Base
    # Associations
    belongs_to :user

    # Methods
      def slug
        title.downcase.gsub(" ", "-")  
      end

      def to_param
        "#{id}-#{slug}"
      end
  end
end
