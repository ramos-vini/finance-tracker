class UserCurrencyConversion < ApplicationRecord
  belongs_to :user
  belongs_to :currency_conversion

  validates :user_id, uniqueness: { scope: :currency_conversion_id }
end
