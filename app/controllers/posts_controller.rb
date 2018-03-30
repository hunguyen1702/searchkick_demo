class PostsController < ApplicationController
  before_action :load_active_authors, :search_post, only: :index

  def index; end

  def autocomplete
    render json: Post.search(params[:term], fields: [:title],
      match: :word_start, limit: 5).map(&:title).uniq
  end
end
