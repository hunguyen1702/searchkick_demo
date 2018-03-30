class StaticPagesController < ApplicationController
  before_action :search_post, only: :index

  def index; end
end
