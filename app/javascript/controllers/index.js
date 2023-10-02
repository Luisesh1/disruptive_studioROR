// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)



const socket = new WebSocket('wss://ws.coinapi.io/v1/');
socket.onopen = function (event) {
    socket.send(JSON.stringify({
        "type": "hello",
        "apikey": "A7CD874F-84F1-4614-8B61-D8BBC6FA5F0D",
        "subscribe_data_type": ["trade"],
        "subscribe_filter_symbol_id": ["BITSTAMP_SPOT_BTC_USD$", "BITFINEX_SPOT_ETH_USD$"]
    }));
};

socket.onmessage = function (event) {
        
        const data = JSON.parse(event.data);
        console.log(data);
        // Add new data to the chart
        // chart.data.labels.push(data.time_exchange);
        // chart.data.datasets[0].data.push(data.price);
        
        // // Remove the oldest data point if there are more than 50
        // if (chart.data.labels.length > 50) {
        //     chart.data.labels.shift();
        //     chart.data.datasets[0].data.shift();
        // }
        
        // Update the chart
        // chart.update();
};

socket.onerror = function (error) {
    console.log(`WebSocket error: ${error}`);
};