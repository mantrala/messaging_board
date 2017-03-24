require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:valid_attributes) {
    {title: 'Hello', body: 'World!'}
  }

  let(:invalid_attributes) {
    {nope: 'nope', yes: 'yes'}
  }

  before :each do
    @user = create(:user)
    sign_in @user
  end

  describe "GET #index" do
    it "assigns all posts as @posts" do
      post = Post.new valid_attributes
      post.user = @user
      post.save!
      get :index, params: {}
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe "GET #show" do
    it "assigns the requested post as @post" do
      post = Post.new valid_attributes
      post.user = @user
      post.save!
      get :show, params: {id: post.to_param}
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "GET #new" do
    it "assigns a new post as @post" do
      get :new, params: {}
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, params: {post: valid_attributes}
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, params: {post: valid_attributes}
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it "redirects to the created post" do
        post :create, params: {post: valid_attributes}
        expect(response).to redirect_to(Post.last)
      end
    end
  end
end
