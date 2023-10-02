module InvestmentsHelper
    def format_currency(amount)
        currency_code = 'USD'
        number_to_currency(amount, unit: currency_code, format: '%u %n')
      end
end
