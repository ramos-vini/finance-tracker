require 'httparty'

class CurrencyConversion < ApplicationRecord
  has_many :user_currency_conversions
  has_many :user, through: :user_currency_conversions

  def self.fetch_and_create(code, codein)
    response = HTTParty.get("https://economia.awesomeapi.com.br/last/#{code}-#{codein}")

    if response.success?
      conversion_code = code + codein
      high_level_key = response[conversion_code]
      current_currency_conversion = self.find_by(conversion_code: conversion_code)

      if current_currency_conversion
        current_currency_conversion.update(
          high: high_level_key["high"],
          low: high_level_key["low"],
          last_updated_at: high_level_key["create_date"])

        return current_currency_conversion 
      else 
        self.create(
          conversion_code: conversion_code,
          code: high_level_key["code"],
          codein: high_level_key["codein"],
          high: high_level_key["high"],
          low: high_level_key["low"],
          last_updated_at: high_level_key["create_date"])

        return CurrencyConversion.last  
      end
    end
  end
end
