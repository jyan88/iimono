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
  mount_uploader :image, ImageUploader
end
