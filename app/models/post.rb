class Post < ActiveRecord::Base
  belongs_to :author

  searchkick word_start: [:title], suggest: [:title],
    highlight: [:title, :content]

  scope :search_post, (lambda do |search_query, page|
    if search_query.nil?
      search paginate_options(page)
    else
      search search_query, search_options.merge(paginate_options(page))
    end
  end)

  def search_data
    {
      title: title,
      author: author.name,
      author_email: author.email,
      content: content
    }
  end

  class << self
    def search_options
      {
        highlight: {
          fields: [:title],
          fragment_size: Settings.post.fragment_size,
          tag: Settings.post.highlight_tag
        },
        suggest: true
      }
    end

    def paginate_options page
      {
        page: page, per_page: Settings.post.page
      }
    end
  end
end
