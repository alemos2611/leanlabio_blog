module Blogr
  class Post < ActiveRecord::Base
    # Callbacks
    before_save :update_status

    # Scopes
    scope :published, -> { where(published: true) }

    # Uploaders
    mount_uploader :header, ImageUploader

    # Associations
    belongs_to :user

    # Methods
    def slug
      title.downcase.gsub(" ", "-")
    end

    def to_param
      "#{id}-#{slug}"
    end

    def update_status
      if published && published_at.nil?
        self.published_at = DateTime.now
      elsif published == false
        self.published_at = nil
      end
    end

    def status
      if published then "Published" else "Draft" end
    end
  end
end
