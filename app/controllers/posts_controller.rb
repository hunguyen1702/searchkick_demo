class PostsController < ApplicationController
  before_action :load_active_authors, :search_post, only: :index

  def index; end

  def autocomplete
    render json: Post.search(params[:term], fields: [:title],
      match: :word_start, limit: 5).map(&:title).uniq
  end

  private

  def search_post
    @posts = Post.search_post params[:search], params[:page]

    respond_to do |format|
      format.json do
        render json: {
          posts: @posts.as_json(include: {
            author: {only: :name}
          }),
          suggestions: @posts.suggestions
        }
      end
      format.html
    end
  end
end
