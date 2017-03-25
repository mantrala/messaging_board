require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "POST /posts/2/comments" do
    it "goes to the index when user is logged in" do
      user = create(:user)
      sign_in user
      new_post = create(:post)

      post post_comments_path(new_post, comment: {body: 'yo yo'})
      expect(response).to have_http_status(302)
    end
  end
end