module Blogr
  class Post < ActiveRecord::Base
    # Callbacks
    before_save :update_status

    # Scopes
    scope :published, -> { where(published: true) }

    # Uploaders
    mount_uploader :header, ImageUploader

    # Associations
    belongs_to :author

    # Methods
    def slug
      title.downcase.gsub(" ", "-")
    end

    def to_param
      "#{id}-#{slug}"
    end

    def update_status
      self.published_at = DateTime.now if published && published_at.nil?
    end

    def status
      if published then "Published" else "Draft" end
    end
  end
end
