require_dependency "blogr/application_controller"

module Blogr
  class UsersController < ApplicationController

    def dashboard
      @users = User.all
      @posts = Post.all
    end

    def new
      @user = User.new
    end

    def edit
      @user = current_user
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to root_url, notice: "New user created!"
      else
        render :new
      end
    end

    def update
      @user = User.find(params[:id])

      if @user.update(user_params)
        redirect_to dashboard_user_path(@user), notice: 'Author updated.'
      else
        render :edit
      end
    end

    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
end
