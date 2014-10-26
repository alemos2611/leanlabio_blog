module Blogr
  class Post < ActiveRecord::Base
    # Modules
    extend FriendlyId
    friendly_id :title, use: :slugged

    # Callbacks
    before_save :update_status

    # Scopes
    scope :published, -> { where(published: true) }

    # Uploaders
    mount_uploader :header, ImageUploader

    # Associations
    belongs_to :author

    # Validations
    validates :title, :text, presence: true
    validates :title, uniqueness: { case_sensitive: false }

    # Methods
    def update_status
      self.published_at = DateTime.now if published && published_at.nil?
    end

    def status
      if published then "Published" else "Draft" end
    end

    def should_generate_new_friendly_id?
      title_changed?
    end
  end
end
