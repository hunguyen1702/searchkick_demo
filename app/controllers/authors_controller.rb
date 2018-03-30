class AuthorsController < ApplicationController
  before_action :load_author, only: :show

  def show; end

  private

  def load_author
    @author = Author.find_by id: params[:id]
    return if @author

    flash[:error] = "Not found"
    redirect_to root_path
  end
end
