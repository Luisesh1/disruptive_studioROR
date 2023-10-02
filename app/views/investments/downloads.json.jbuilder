json.array! @assetsInfo do |asset|
    json.name asset[:name]
    json.abreviatura asset[:asset_id]
    json.precioEnDolares asset[:price]
    json.iconUrl asset[:iconUrl]
end