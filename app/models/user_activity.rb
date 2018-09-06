class UserActivity < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  def self.valid(params, current_user)
    last_event_date = select(:created_At).where("activity_id = ? AND user_id = ?", params[:activity_id], current_user).maximum(:created_at)
    return true unless last_event_date
    (Time.now - last_event_date) > 43200
  end
end
