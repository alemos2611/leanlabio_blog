require_dependency "blogr/application_controller"

module Blogr
  class SubscribersController < ApplicationController
    before_action :set_subscriber, only: [:show, :edit, :update, :destroy]
    skip_before_filter :authorize, only: [:new, :create]
    skip_before_filter :new_subscriber

    # GET /subscribers
    def index
      @subscribers = Subscriber.all
    end

    # GET /subscribers/1
    def show
    end

    # GET /subscribers/new
    def new
      @subscriber = Subscriber.new
    end

    # GET /subscribers/1/edit
    def edit
    end

    # POST /subscribers
    def create
      @subscriber = Subscriber.new(subscriber_params)

      if @subscriber.save
        redirect_to root_url, notice: 'Great! we\'ll send you updates when we publish new articles.'
      else
        render :new
      end
    end

    # PATCH/PUT /subscribers/1
    def update
      if @subscriber.update(subscriber_params)
        redirect_to dasboard_user_path(current_user), notice: 'Subscriber was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /subscribers/1
    def destroy
      @subscriber.destroy
      redirect_to dasboard_user_path(current_user), notice: 'Subscriber was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_subscriber
        @subscriber = Subscriber.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def subscriber_params
        params.require(:subscriber).permit(:email)
      end
  end
end
