json.assetInfo do
    json.name @assetInfo[:name]
    json.balance @assetInfo[:initialBalance]
    json.anualEarns @assetInfo[:earns]
    json.monthlyInterest @assetInfo[:monthlyInterest]
    json.assetBalance @assetInfo[:assetBalance]
    json.iconUrl @assetInfo[:iconUrl]
    json.price @assetInfo[:price]
    json.assetId @assetInfo[:assetId]
end
