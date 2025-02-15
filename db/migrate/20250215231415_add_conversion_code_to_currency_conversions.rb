class AddConversionCodeToCurrencyConversions < ActiveRecord::Migration[7.2]
  def change
    add_column :currency_conversions, :conversion_code, :string
  end
end
