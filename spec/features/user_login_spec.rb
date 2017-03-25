require "rails_helper"

describe "the signin process", :type => :feature do
  before :each do
    @user = create(:user)
  end

  it "signs me in" do
    visit new_user_session_path
    fill_in 'Email',    with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit root_path
    expect(page).to have_content "Welcome: #{@user.full_name}"
  end
end