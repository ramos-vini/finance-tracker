class CreateCurrencyConversions < ActiveRecord::Migration[7.2]
  def change
    create_table :currency_conversions do |t|
      t.string :code
      t.string :codein
      t.decimal :high
      t.decimal :low
      t.string :last_updated_at

      t.timestamps
    end
  end
end
