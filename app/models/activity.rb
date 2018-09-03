class Activity < ApplicationRecord

  validates :title, uniqueness: true, presence: true
  validates_presence_of :points, require: true
  validates_presence_of :category, require: true
end
