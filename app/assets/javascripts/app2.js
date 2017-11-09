

/* global Vue */
document.addEventListener("DOMContentLoaded", function(event) { 
  var Web3 = require('web3');
  var web3 = new Web3();
  web3.setProvider(new web3.providers.HttpProvider("https://mainnet.infura.io/xDUJTvOvvpbDQhnvbIjj"));
  var app2 = new Vue({
    el: '#app2',
    data: {
      token_list: 
        [{"OMG": ["0xd26114cd6EE289AccF82350c8d8487fedB8A0C07", omgabi]},
         {"PAY": ["0xB97048628DB6B661D4C2aA833e95Dbe1A905B280", payabi]},
         {"REP": ["0xe94327d07fc17907b4db788e5adf2ed424addff6", repabi]},
         {"GNT": ["0xa74476443119A942dE498590Fe1f2454d7D4aC0d", gntabi]},
         {"BAT": ["0x0d8775f648430679a709e98d2b0cb6250d2887ef", batabi]},
         {"MTL": ["0xF433089366899D83a9f26A773D59ec7eCF30355e", mtlabi]},
         {"DGD": ["0xe0b7927c4af23765cb51314a0e0521a9645f0e2a", dgdabi]},
         {"SNT": ["0x744d70fdbe2ba4cf95131626614a1763df805b9e", sntabi]},
         {"FUN": ["0x419d0d8bdd9af5e606ae2232ed285aff190e711b", funabi]},
         {"SNGLS": ["0xaec2e87e0a235266d9c5adc9deb4b2e29b54d009", snglsabi]},
         {"GNO": ["0x6810e776880c02933d47db1b9fc05908e5386b96", gnoabi]},
         {"BNT": ["0x1f573d6fb3f13d689ff844b4ce37794d79a7ff1c", bntabi]},
         {"ANT": ["0x960b236A07cf122663c4303350609A66A7B288C0", antabi]},
         {"MLN": ["0xBEB9eF514a379B997e0798FDcC901Ee474B6D9A1", mlnabi]},
         {"STORJ": ["0xb64ef51c888972c908cfacf59b47c1afbc0ab8ac", storjabi]},
         {"CFI": ["0x12fef5e57bf45873cd9b62e9dbd7bfb99e32d73e", cfiabi]},
         {"DNT": ["0x0abdace70d3790235af448c88547603b945604ea", dntabi]}],
      vuecoins: [],
      addresses: []
    },

    mounted() {
        // this.loadWallets();
      $.get('/wallets', function(data) {
        this.addresses = data.wallets;
        this.vuecoins = data.coins;
        this.getEtherBalance();
        this.getSubtokenBalances();
        this.addSeen();
      }.bind(this));
    },

    methods: {
      // loadWallets: function() {
      //   this.$http.get('/wallets', function(data, status, request){
      //     if(status == 200)
      //     {
      //       this.addresses = data.wallets;
      //       this.vuecoins = data.coins;
      //     }
      //   });
      // },
      getEtherBalance: function() {
        var i = 0
        for (let address of this.addresses) {
              var wei = web3.eth.getBalance(address.address);
              var balance = web3.fromWei(wei, 'ether');
              address['eth_balance'] = parseFloat(balance);
              address['eth_position_value'] = parseFloat(balance) * this.vuecoins[0].current_price;
              i++;
        }
      },
      getSubtokenBalances() {
        var i = 0;
        for (let address of this.addresses) {
          address.coins = [];
          for (let token of this.token_list) {
            var coin = web3.eth.contract(token[Object.keys(token)][1]).at(token[Object.keys(token)][0]);
            var balance = coin.balanceOf(address.address) / parseFloat(1e16);
            if (balance > 0) {
              var current_price = parseFloat(this.addPrice(Object.keys(token)[0]));
              address.coins.push({ name: Object.keys(token)[0], value: balance, position_value: current_price * balance });
            }
          }
          i++;
        }
      },
      addSeen() {
        for (let address of this.addresses) {
          Vue.set(address, "seen", false);
        }
      },
      addPrice(arg) {
        for (let coin of this.vuecoins) {
          if (coin.ticker === arg) {
            return coin.current_price;
          }
        }
      },
      // // addWallet() {
      // //   // $.post('/wallets', { address: this.newWallerAddress})
      // // }

      toggleCoins(address) {
        address.seen = !address.seen;
      }
    }

  });
});