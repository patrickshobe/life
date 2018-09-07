# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
require 'csv'

# Activities seed
CSV.foreach('./db/activities.csv', headers: true, header_converters: :symbol) do |activity|
  Activity.create(id: activity[:id],
                  title: activity[:title],
                  points: activity[:points],
                 category: activity[:category])
end

# Levels Seed
CSV.foreach('./db/levels.csv', headers: true, header_converters: :symbol) do |level|
  Level.create(level: level[:level],
                  min_score: level[:min],
                  max_score: level[:max])
end

# Create Admin
User.create(username: 'Bart Simpson', password: '1234')
User.create(username: 'Lisa Simpson', password: '1234')

# Usr Activity Seed
CSV.foreach('./db/user_activities.csv', headers: true, header_converters: :symbol) do |user_activity|
  UserActivity.create(user_id: user_activity[:user_id],
                      activity_id: user_activity[:activity_id],
                      created_at: user_activity[:created_at],
                      updated_at: user_activity[:updated_at])
end

