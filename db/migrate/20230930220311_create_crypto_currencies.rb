class CreateCryptoCurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :crypto_currencies do |t|
      t.string :name
      t.float :monthlyInterest
      t.float :initialBalance

      t.timestamps
    end
  end
end
