class CryptoCurrency < ApplicationRecord
    
    def calculateEarns
        nMonths = 12
        monthlyEarns = initialBalance * (1 + (monthlyInterest / 100));
        anualEarns = monthlyEarns *  nMonths
    end

end
