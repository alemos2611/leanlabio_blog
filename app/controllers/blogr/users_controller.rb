require_dependency "blogr/application_controller"

module Blogr
  class UsersController < ApplicationController

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to root_url, notice: "New user created!"
      else
        render :new
      end
    end

    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
end
