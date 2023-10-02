class InvestmentsController < ApplicationController

  def index
    @cryptoCurrencys = CryptoCurrency.all
    @assetsInfo = getCoinApiData(@cryptoCurrencys)
  end

  def calculateEarns
    
    id = params[:id]
    balance = params[:balance]
    @cryptoCurrency = CryptoCurrency.find(id);
    assetsInfo = getCoinApiData([@cryptoCurrencys])[@cryptoCurrency.name]
    @cryptoCurrency.initialBalance = balance;
    @assetBalance = @cryptoCurrency.calculateAssetBalance(assetsInfo[:price])

  end

  def getCoinApiData(cryptoCurrencys)
    info = {}
    service = CoinApiService.new
    allIcons = service.get_icons
    allAssets = service.get_info_by_asset
    cryptoCurrencys.each do |asset|
      assetData = allAssets.find {|i| i['name'] == asset.name }
      iconUrl = allIcons.find {|i| i['asset_id'] == assetData['asset_id']}
      info[asset.name] = {
        assetId: assetData["asset_id"],
        name: asset.name,
        iconUrl: iconUrl["url"],
        price: assetData["price_usd"]
      }
    end
    info
  end

end
