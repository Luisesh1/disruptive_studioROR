class InvestmentsController < ApplicationController
  def index
    @cryptoCurrencys = CryptoCurrency.all
  end

  def calculateEarns
    id = params[:id]
    balance = params[:balance]
    @cryptoCurrency = CryptoCurrency.find(id);
    @cryptoCurrency.initialBalance = balance;
  end
end
