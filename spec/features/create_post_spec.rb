require "rails_helper"

describe "creating a post", :type => :feature do
  before :each do
    @user = create(:user)
    visit new_user_session_path
    fill_in 'Email',    with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit root_path

    click_link 'Create a new post'

    fill_in 'Title', with: 'A new blogpost'
    fill_in 'Body',  with: 'A long post'
    click_button 'Create'
  end

  it "creates a new post" do
    expect(page).to have_content 'A new blogpost'
  end

  it "can post a comment to a post" do
    fill_in 'comment_body', with: 'this is a comment'
    click_button 'Comment'

    expect(page).to have_content 'this is a comment'
  end
end