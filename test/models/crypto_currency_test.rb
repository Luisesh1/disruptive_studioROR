require 'test_helper'

class CryptoCurrencyTest < ActiveSupport::TestCase
  def setup
    @crypto_currency = CryptoCurrency.new(
      name: "Bitcoin",
      initialBalance: 1000,
      monthlyInterest: 5
    )
  end

  test "calculateEarns returns the correct annual earnings" do
    expected_earns = (@crypto_currency.initialBalance * (1 + (@crypto_currency.monthlyInterest / 100)))*12
    assert_equal expected_earns, @crypto_currency.calculateEarns
  end

  test "calculateAssetBalance returns the correct asset balance" do
    price = 100.0
    expected_balance = (1 / price) * @crypto_currency.initialBalance
    assert_equal expected_balance, @crypto_currency.calculateAssetBalance(price)
  end
end
