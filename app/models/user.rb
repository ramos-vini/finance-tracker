class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_currency_conversions
  has_many :currency_conversion, through: :user_currency_conversions
  has_many :friendships
  has_many :friends, through: :friendships

  validates :first_name, :last_name, presence: true, length: { minimum: 2, maximum: 20 }

  def full_name
    "#{first_name} #{last_name}"
  end

  def is_friends_with?(user)
    true if self.friends.find_by(id: user.id)
  end

  def track_currency_conversion?(currency_conversion)
    true if self.currency_conversion.find_by(id: currency_conversion.id)
  end
end
