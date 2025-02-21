class CreateUserCurrencyConversions < ActiveRecord::Migration[7.2]
  def change
    create_table :user_currency_conversions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :currency_conversion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
