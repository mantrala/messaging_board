require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "has body attributes" do
    c = Comment.new
    expect(c.respond_to?(:body)).to eq(true)
    expect(c.respond_to?(:user)).to eq(true)
    expect(c.respond_to?(:post)).to eq(true)
  end

  it "required fields for Comment" do
    c = Comment.new

    expect(c.valid?).to eq(false)
    expect(c.errors.count).to eq(3)
    expect(c.errors.messages[:body]).not_to eq(nil)
    expect(c.errors.messages[:user]).not_to eq(nil)
    expect(c.errors.messages[:post]).not_to eq(nil)
  end
end
