# email:string
# password_digest: string
#
# password: string virtual
# password_confirmation: string virtual
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
  has_many :messages
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "enter valid of email" }
end
