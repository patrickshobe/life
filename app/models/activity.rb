class Activity < ApplicationRecord

  validates :title, uniqueness: true, presence: true
  validates_presence_of :points, require: true
  validates_presence_of :category, require: true

  has_many :user_activities
  has_many :users, through: :user_activities
end
