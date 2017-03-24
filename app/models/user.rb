class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :posts, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end

end
