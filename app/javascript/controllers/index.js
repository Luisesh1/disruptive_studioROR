// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)



let excecuteWs = (data) => {
    let assets_ids = data.map(i => `COINBASE_SPOT_${i.assetId}_USD$`)
    console.log(assets_ids);
    const socket = new WebSocket('wss://ws.coinapi.io/v1/');
    socket.onopen = function (event) {
        socket.send(JSON.stringify({
            "type": "hello",
            "apikey": "24D352AA-00DB-4FBC-BB20-4A07FE573363",
            "subscribe_data_type": ["trade"],
            "subscribe_filter_symbol_id": assets_ids
        }));
    };

    socket.onmessage = function (event) {
        const data = JSON.parse(event.data);
        $('#'+data.symbol_id).text(data.price);
        console.log(data);
    };

    socket.onerror = function (error) {
        console.log(`WebSocket error: ${error}`);
    };

}

$.get("/investments.json", excecuteWs);

let timeoutId;
let buscar = (context) => {
    let id = $(context).data('id');
    let balance = $(context).val();
    $(`#earns_${id}`).text('');
    $(`#assetBalance_${id}`).text('');
    $.get(`/investments/calculateEarns.json?id=${id}&balance=${balance}`, (data) => {
        data = data.assetInfo;
        console.log(id);
        console.log(data);
        $(`#earns_${id}`).text(data.anualEarns);
        $(`#assetBalance_${id}`).text(data.assetBalance);
    })
}

$(".balanceInput").on("keyup", function() {
    let context = this;
    clearTimeout(timeoutId);
    timeoutId = setTimeout(() => buscar(context), 1000);
    
});
