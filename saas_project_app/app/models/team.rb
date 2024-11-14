class Team < ApplicationRecord
  validates_uniqueness_of :name
  validates_presence_of :name

  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  has_many :projects, dependent: :destroy
end
