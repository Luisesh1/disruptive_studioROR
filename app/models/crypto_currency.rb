class CryptoCurrency < ApplicationRecord
    validates :initialBalance, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :monthlyInterest, presence: true, numericality: { greater_than_or_equal_to: 0 }
    def calculateEarns
        nMonths = 12
        monthlyEarns = initialBalance * (1 + (monthlyInterest / 100));
        anualEarns = monthlyEarns *  nMonths
    end

    def calculateAssetBalance(price)
        (1 / price.to_f) * initialBalance
    end

end
