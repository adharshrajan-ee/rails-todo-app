require 'rails_helper'

describe User, type: :model do
  before(:all) do
    User.create!(first_name: "test", last_name: "name", email: "test@xyz.com")
  end

  it "should create a new record" do
    new_user = User.create(first_name: "test", last_name: "name", email: "abc@xyz.com")
    expect(new_user).not_to be nil?
    expect(new_user.first_name).to eq "test"
  end

  it "should not create a new record when email is already present" do
    expect {
      User.create(first_name: "test", last_name: "name", email: "test@xyz.com")
    }
      .to raise_error(ActiveRecord::RecordNotUnique)
  end

  it "should return full name" do
    user = User.first
    expect(user.full_name).to eq("test name")
  end

  after(:all) do
    User.all.destroy_all
  end
end