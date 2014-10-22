require_dependency "blogr/application_controller"

module Blogr
  class AuthorsController < ApplicationController
    #skip_before_filter :authorize, only: [:new, :create]

    def dashboard
      @authors = Author.all
      @posts = Post.all
    end

    def new
      @author = Author.new
    end

    def edit
      @author = current_author
    end

    def create
      @author = Author.new(author_params)

      if @author.save
        session[:author_id] = @author.id
        redirect_to dashboard_author_path(@author), notice: "New author created!"
      else
        render :new
      end
    end

    def update
      @author = Author.find(params[:id])

      if @author.update(author_params)
        redirect_to dashboard_author_path(@author), notice: 'Author updated.'
      else
        render :edit
      end
    end

    private
    def author_params
      params.require(:author).permit(:name, :email, :password, :password_confirmation, :avatar)
    end
  end
end
