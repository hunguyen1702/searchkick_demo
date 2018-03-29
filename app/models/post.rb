class Post < ActiveRecord::Base
  belongs_to :author

  searchkick word_start: [:title], suggest: [:title],
    highlight: [:title, :content]

  def search_data
    {
      title: title,
      author: author.name,
      author_email: author.email,
      content: content
    }
  end
end
