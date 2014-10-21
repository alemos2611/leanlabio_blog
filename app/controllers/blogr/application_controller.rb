module Blogr
  class ApplicationController < ActionController::Base
    before_filter :authorize, :set_meta, :new_subscriber

    def set_meta(title="", description="", keyowrds="")
      @meta_title = if title != "" then title else Blogr.meta_title end
      @meta_description = if description != "" then title else Blogr.meta_description end
      @meta_keywords = if keyowrds != "" then title else Blogr.meta_keywords end
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
      true if current_author
    end
    helper_method :is_admin?
  end
end
