var Web3 = require('web3');
var web3 = new Web3();
web3.setProvider(new web3.providers.HttpProvider("https://mainnet.infura.io/xDUJTvOvvpbDQhnvbIjj"));

function getBalance() {
    var wallets = document.getElementsByClassName('wallets');
    for (i = 0; i < wallets.length; i++) {
        try {
            var wei = web3.eth.getBalance(wallets[i].innerHTML);
            var balance = web3.fromWei(wei, 'ether');
            document.getElementById(wallets[i].id + "_eth").innerHTML = balance + "ETH";
        }
        catch (err) {
            document.getElementById(wallets[i] + "_eth").innerHTML = err.message;
        }
    }
}
