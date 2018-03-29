class PostsController < ApplicationController
  def index
    search_query = params[:search] || {}
    return @posts = Post.search(search_query,
      highlight: {fields: [:name, :content], fragment_size: Settings.post.fragment_size},
      suggest: true, page: params[:page], per_page: Settings.post.page) if search_query.present?
    @posts = Post.search page: params[:page], per_page: Settings.post.page
  end

  def autocomplete
    render json: Post.search(params[:term],
      {fields: [:title], match: :word_start, limit: 5}).map(&:title).uniq
  end
end
