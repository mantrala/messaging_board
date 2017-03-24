require 'rails_helper'

RSpec.describe Post, type: :model do
  it "has body and text attributes" do
    p = Post.new
    expect(p.respond_to?(:body)).to eq(true)
    expect(p.respond_to?(:title)).to eq(true)
  end

  it "required fields for Post" do
    p = Post.new

    expect(p.valid?).to eq(false)
    expect(p.errors.count).to eq(3)
    expect(p.errors.messages[:body]).not_to eq(nil)
    expect(p.errors.messages[:title]).not_to eq(nil)
  end
end
