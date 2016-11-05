const elm = require('./build/elm-bundle');
const name = process.argv[2];
const ports = elm.Main.worker({name: name}).ports;

function updateMessage(messageFromElm){
    return {
        message: 'Hey elm!',
        times: messageFromElm.times +1
    };
}

ports.sayHello.subscribe(function (messageFromElm) {
    console.log("Elm said:", messageFromElm);
    setTimeout(() => ports.respondToHello.send(updateMessage(messageFromElm)), 1000);
});

console.log("listening for elm messages");
