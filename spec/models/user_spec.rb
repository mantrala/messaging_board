require 'rails_helper'

RSpec.describe User, type: :model do
  it "has email and firstname attributes" do
    u = User.new
    expect(u.respond_to?(:first_name)).to eq(true)
    expect(u.respond_to?(:email)).to eq(true)
  end

  it "required fields for User" do
    u = User.new

    expect(u.valid?).to eq(false)
    expect(u.errors.count).to eq(5)
    expect(u.errors.messages[:email]).not_to eq(nil)
    expect(u.errors.messages[:password]).not_to eq(nil)
  end
end
