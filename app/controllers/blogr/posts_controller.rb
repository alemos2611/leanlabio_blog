require_dependency "blogr/application_controller"

module Blogr
  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    skip_before_filter :authorize, only: [:show, :index, :rss]

    # GET /posts
    def index
      @posts = Post.published.order(published_at: :desc)
      Analytics.track(user_id: analytics_id, event: "View: blogr_posts#index", properties: {}) unless is_robot?

      respond_to do |format|
        format.html
        format.rss { render :layout => false }
      end
    end

    def rss
      @posts = Post.published.order(published_at: :desc)

      respond_to do |format|
        format.rss { render :layout => false }
      end
    end

    # GET /posts/1
    def show
      set_meta(@post.title, @post.description, @post.meta_keywords)
      Analytics.track(user_id: analytics_id, event: "View: blogr_posts#show", properties: { post_id: @post.id }) unless is_robot?
    end

    # GET /posts/new
    def new
      @post = Post.new
    end

    # GET /posts/1/edit
    def edit
    end

    # POST /posts
    def create
      @post = current_author.posts.build(post_params)

      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /posts/1
    def destroy
      @post.destroy
      redirect_to root_url, notice: 'Post was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.friendly.find(params[:id])
        # Redirect users if not admin and post is unpublished
        if !@post.published && is_admin? == false
          redirect_to root_url
        end
      end

      # Only allow a trusted parameter "white list" through.
      def post_params
        params.require(:post).permit(:title, :text, :user_id, :published, :header, :description, :meta_keywords, :img_alt_text)
      end
  end
end
