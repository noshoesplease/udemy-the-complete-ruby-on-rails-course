class Article < ApplicationRecord
  # article = Article.new
  # article.save // returns false and wont save
  # if a validator is present and the
  # title or description are not present
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end
