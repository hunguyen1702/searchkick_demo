class StaticPagesController < ApplicationController
  before_action :load_active_authors, only: :index
  before_action :all_posts, only: :posts

  def index
    render "static_pages/index"
  end

  def posts; end

  private

  def all_posts
    @posts = Post.all_post_match_with params[:search]

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
