class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :validatable,
  #       :lockable,:timeoutable,:omniauthable
  mount_uploader :icon, ImageUploader
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true
  before_validation { email.downcase! }
  #has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :blogs
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
