class CryptoCurrency < ApplicationRecord
    validates :initialBalance, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :monthlyInterest, presence: true, numericality: { greater_than_or_equal_to: 0 }

    def calculateEarns()
        n_months = 12
        anual_earns = initialBalance
        n_months.times do
            anual_earns *= (1 + (monthlyInterest / 100.0))
        end
        anual_earns - initialBalance
    end
      

    def calculateAssetBalance(price)
        (1 / price.to_f) * initialBalance
    end

end
