require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before :each do
    @user = create(:user)
    sign_in @user
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comment" do
        new_post = create(:post)
        comment_attributes = FactoryGirl.attributes_for(:comment, :post_id => new_post)
        expect {
          post :create, params: {:post_id => new_post.id, comment: comment_attributes}
        }.to change(Comment, :count).by(1)
      end

      it "assigns a instance variable as @post" do
        new_post = create(:post)
        comment_attributes = FactoryGirl.attributes_for(:comment, :post_id => new_post)

        post :create, params: {:post_id => new_post.id, comment: comment_attributes}
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it "redirects to the current post" do
        new_post = create(:post)
        comment_attributes = FactoryGirl.attributes_for(:comment, :post_id => new_post)
        post :create, params: {:post_id => new_post.id, comment: comment_attributes}

        expect(response).to redirect_to(new_post)
      end
    end
  end
end