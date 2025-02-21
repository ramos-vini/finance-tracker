class UserCurrencyConversion < ApplicationRecord
  belongs_to :user
  belongs_to :currency_conversion
end
