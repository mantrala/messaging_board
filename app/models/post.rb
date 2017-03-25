class Post < ApplicationRecord
  validates :title, presence: true
  validates :body,  presence: true

  belongs_to :user
  has_many   :comments, dependent: :destroy

  scope :all_posts, -> { eager_load(:user).all.order('posts.created_at desc') }
  scope :find_post, -> (id) { includes(:user, comments: :user).find(id) }
end
