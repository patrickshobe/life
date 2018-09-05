# models/user.rb
class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  enum role: %w(default admin)
  has_secure_password

  has_many :user_activities
  has_many :activities, through: :user_activities

  def points
    self.activities.sum(:points)
  end

  def level
    @level = Level.find_by("#{points} between min_score and max_score")
    @level ||= Level.first
  end

  def progress
    progress = ((points.to_f / level.max_score) * 100).round(2).to_s + '%'
    progress ||= 0
  end
end

