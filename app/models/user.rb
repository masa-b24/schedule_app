class User < ApplicationRecord
  has_many :tasks
  has_one_attached :image
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
end
