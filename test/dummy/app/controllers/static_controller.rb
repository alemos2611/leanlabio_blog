class StaticController < ApplicationController
  skip_before_filter :authorize, only: [:index]

  def index

  end
end
