module Blogr
  class ApplicationController < ActionController::Base
    before_filter :authorize
    
    private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def authorize
      redirect_to root_url, alert: "Not authorized!" if current_user.nil?
    end

    def is_author?
      true if current_user
    end
    helper_method :is_author?
  end
end
