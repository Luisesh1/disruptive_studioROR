json.cryptoCurrency do
    json.name @cryptoCurrency.name
    json.balance @cryptoCurrency.initialBalance
    json.anualEarns @cryptoCurrency.calculateEarns
    json.monthlyInterest @cryptoCurrency.monthlyInterest
end
  