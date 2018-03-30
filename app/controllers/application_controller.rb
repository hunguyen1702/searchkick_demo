class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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

  def load_active_authors
    @active_authors = Author.get_most_active_authors(
      Settings.author.number_of_most_active
    )
  end
end
