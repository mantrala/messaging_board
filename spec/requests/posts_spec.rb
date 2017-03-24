require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "goes to the index when user is logged in" do
      user = create(:user)
      sign_in user

      get posts_path
      expect(response).to have_http_status(200)
    end

    it "redirects to login page if user is not authneticated" do
      get posts_path

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_user_session_url)
    end
  end
end