=begin

association types for ActiveRecord entities
belongs_to
has_one
has_many
has_many :through
has_one :through
has_and_belongs_to_many

=end

class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_many :articles

  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }
end
