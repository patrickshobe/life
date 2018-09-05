# models/user.rb
class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  enum role: %w(default admin)
  has_secure_password

  has_many :user_activities
  has_many :activities, through: :user_activities

  def update_level
    level = Level.find_by("#{self.activities.sum(:points)} between min_score AND max_score")
    self.level = level.id if level
  end
end

