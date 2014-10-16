require_dependency "blogr/application_controller"

module Blogr
  class SessionsController < ApplicationController
    skip_before_filter :authorize, only: [:new, :create]

    def new
    end

    def create
      user = User.find_by_email(params[:email])

      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to dashboard_user_path(current_user), notice: "Logged in!"
      else
        flash[:error] = "Email or password is invalid."
        render :new
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_url, notice: "Logged out!"
    end
  end
end
