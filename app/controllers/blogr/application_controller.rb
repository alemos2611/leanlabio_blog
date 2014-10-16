module Blogr
  class ApplicationController < ActionController::Base
    before_filter :authorize, :set_meta

    def set_meta(title="", description="", keyowrds="")
      @meta_title = if title != "" then title else Blogr.meta_title end
      @meta_description = if description != "" then title else Blogr.meta_description end
      @meta_keywords = if keyowrds != "" then title else Blogr.meta_keywords end
    end

    private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def authorize
      redirect_to root_url, alert: "Not authorized!" if current_user.nil?
    end

    def is_admin?
      true if current_user
    end
    helper_method :is_admin?
  end
end
