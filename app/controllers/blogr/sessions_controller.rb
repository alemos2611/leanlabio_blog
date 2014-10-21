require_dependency "blogr/application_controller"

module Blogr
  class SessionsController < ApplicationController
    skip_before_filter :authorize, only: [:new, :create]

    def new
    end

    def create
      author = Author.find_by_email(params[:email])

      if author && author.authenticate(params[:password])
        session[:author_id] = author.id
        redirect_to dashboard_author_path(current_author), notice: "Logged in!"
      else
        flash[:error] = "Email or password is invalid."
        render :new
      end
    end

    def destroy
      session[:author_id] = nil
      redirect_to root_url, notice: "Logged out!"
    end
  end
end
