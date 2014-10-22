module Blogr
  class ApplicationController < ActionController::Base
    before_filter :authorize, :set_meta, :new_subscriber

    def set_meta(title="Startup Idea Generation and Validation - Lenalab Blog", description="We're all about startup ideas. How to generate ideas, how to pick ideas, and how to validate ideas. We're learning all the time and will be sharing what we do here.", keywords="startup ideas, startup idea validation, startup idea generation, finding startup ideas, how to have startup ideas")
      @meta_title = title
      @meta_description = description
      @meta_keywords = keywords
    end

    private

    def new_subscriber
        @subscriber = Subscriber.new
    end

    def current_author
      @current_author ||= Author.find(session[:author_id]) if session[:author_id]
    end
    helper_method :current_author

    def authorize
      redirect_to root_url, alert: "Not authorized!" if current_author.nil?
    end

    def is_admin?
      if current_author then true else false end
    end
    helper_method :is_admin?
  end
end
