require 'rails_helper'

describe UserActivity, type: :model do
    describe "relationships" do
      it {should belong_to(:user)}
      it {should belong_to(:activity)}
    end
  end
