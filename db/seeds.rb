20.times do
  Author.create name: Faker::Name.name, email: Faker::Internet.email
end

quote_src = [Faker::Matz, Faker::Friends, Faker::Movie]

def generate_paragraph src, sentences
  (1..sentences).map do
    src[rand(0..(src.length - 1))].quote
  end.join(" ")
end

Author.all.each do |author|
  (1..40).each do
    content = (1..2).map do
      generate_paragraph quote_src, 10
    end.join("\n")

    post = author.posts.build title: Faker::Book.title,
      content: content, author_id: author.id
    post.save
  end
end
