class Post < ApplicationRecord
  validates :title, presence: true
  validates :body,  presence: true

  belongs_to :user

  scope :all_posts, -> { includes(:user).all.order('created_at desc') }
end
