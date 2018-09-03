require 'rails_helper'

describe Activity, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:points)}
    it {should validate_presence_of(:category)}
  end
end
