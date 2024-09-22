=begin

association types for ActiveRecord entities
belongs_to
has_one
has_many
has_many :through
has_one :through
has_and_belongs_to_many

=end

class Article < ApplicationRecord
  belongs_to :user

  # article = Article.new
  # article.save // returns false and wont save
  # if a validator is present and the
  # title or description are not present
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end
