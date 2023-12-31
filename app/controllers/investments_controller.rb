class InvestmentsController < ApplicationController
  def index
    cryptoCurrencys = CryptoCurrency.all
    @assetsInfo = integrateCoinApiData(cryptoCurrencys)
  end

  def calculateEarns
    id = params[:id]
    balance = params[:balance]
    cryptoCurrency = CryptoCurrency.find(id);
    cryptoCurrency.initialBalance = balance;
    @assetInfo = integrateCoinApiData([cryptoCurrency])[0]
  end

  def integrateCoinApiData(cryptoCurrencys)
    info = []
    service = CoinApiService.new
    allIcons = service.get_icons
    allAssets = service.get_info_by_asset
    cryptoCurrencys.each do |asset|
      assetData = allAssets.find {|i| i['name'] == asset.name }
      iconUrl = allIcons.find {|i| i['asset_id'] == assetData['asset_id']}
      info.push( {
        assetId: assetData["asset_id"],
        iconUrl: iconUrl["url"],
        price: assetData["price_usd"],
        name: asset.name,
        monthlyInterest: asset.monthlyInterest,
        initialBalance: asset.initialBalance,
        assetBalance: asset.calculateAssetBalance(assetData["price_usd"]),
        earns: asset.calculateEarns(),
        currencyId: asset.id
      })
    end
    info
  end

  def downloads
    cryptoCurrencys = CryptoCurrency.all
    @assetsInfo = integrateCoinApiData(cryptoCurrencys)
  end

end
