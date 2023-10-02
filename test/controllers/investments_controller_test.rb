require "test_helper"

class InvestmentsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    WebMock.enable_net_connect!
    get '/investments'
    assert_response :success
    assert_template :index
  end

  test "should calculate earns" do
    WebMock.enable_net_connect!
    crypto_currency = crypto_currencies(:one)
    get '/investments/calculateEarns.json', params: {id:1, balance: 1000 }
    assert_response :success
    assert_template "investments/calculateEarns"
  end

  test "should integrate CoinApi data" do
    WebMock.disable_net_connect!
    crypto_currency = crypto_currencies(:one)
    stub_request(:get, "https://rest.coinapi.io/v1/assets").
      to_return(body: '[{ "name": "Bitcoin", "asset_id": "BTC", "price_usd": 50000 }]')
    stub_request(:get, "https://rest.coinapi.io/v1/assets/icons/1024").
      to_return(body: '[{ "asset_id": "BTC", "url": "https://example.com/bitcoin.png" }]')
    @controller = InvestmentsController.new
    result = @controller.integrateCoinApiData([crypto_currency])
    assert_equal 1, result.length
    assert_equal 'BTC', result[0][:assetId]
    assert_equal 'https://example.com/bitcoin.png', result[0][:iconUrl]
    assert_equal 50000, result[0][:price]   
  end
end
