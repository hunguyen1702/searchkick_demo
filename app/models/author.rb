class Author < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  scope :get_most_active_authors, (lambda do |author_number|
    find_by_sql("select a.name, a.id, count(p.id) as post_count
      from posts as p right outer join authors as a on p.author_id = a.id
      group by a.id order by post_count desc limit #{author_number}")
  end)
end
