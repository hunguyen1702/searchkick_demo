class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def load_active_authors
    @active_authors = Author.get_most_active_authors(
      Settings.author.number_of_most_active
    )
  end
end
