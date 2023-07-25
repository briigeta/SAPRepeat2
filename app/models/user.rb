class User < ApplicationRecord
  has_many :passwords, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
