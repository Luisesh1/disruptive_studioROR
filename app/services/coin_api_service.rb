require 'net/http'
require 'json'

class CoinApiService
  BASE_URL = "https://rest.coinapi.io/v1"

  def initialize
    @uri = URI(BASE_URL)
    @http = Net::HTTP.new(@uri.host, @uri.port)
    @http.use_ssl = true
  end

  def get_icons
    uri_complement = "/assets/icons/1024"
    request = Net::HTTP::Get.new(@uri.request_uri + uri_complement, headers)
    response = @http.request(request)

    if response.code.to_i == 200
      data = JSON.parse(response.body)
      return data
    else
      puts "#{response.code} - #{response.message}"
    end
  rescue => e
    puts "Error de solicitud: #{e.message}"
  end

  def get_info_by_asset
    uri_complement = "/assets"
    request = Net::HTTP::Get.new(@uri.request_uri + uri_complement, headers)
    response = @http.request(request)

    if response.code.to_i == 200
      data = JSON.parse(response.body)
      return data
    else
      puts "#{response.code} - #{response.message}"
    end
  rescue => e
    puts "Error de solicitud: #{e.message}"
  end


  private

  def headers
    {
      "X-CoinAPI-Key" => Rails.application.credentials.coinapi_key
    }
  end
end