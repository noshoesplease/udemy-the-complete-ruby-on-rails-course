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
end
