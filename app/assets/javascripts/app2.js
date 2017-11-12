/* global Vue */
document.addEventListener("DOMContentLoaded", function(event) { 
  

  var Web3 = require('web3');
  var web3 = new Web3();
  web3.setProvider(new web3.providers.HttpProvider("https://mainnet.infura.io/xDUJTvOvvpbDQhnvbIjj"));
  var app2 = new Vue({
    el: '#app2',
    data: {
      token_list: 
        [{"OMG": ["0xd26114cd6EE289AccF82350c8d8487fedB8A0C07", omgabi, 18]},
         {"PAY": ["0xB97048628DB6B661D4C2aA833e95Dbe1A905B280", payabi, 18]},
         {"REP": ["0xe94327d07fc17907b4db788e5adf2ed424addff6", repabi, 18]},
         {"GNT": ["0xa74476443119A942dE498590Fe1f2454d7D4aC0d", gntabi, 18]},
         {"BAT": ["0x0d8775f648430679a709e98d2b0cb6250d2887ef", batabi, 18]},
         {"MTL": ["0xF433089366899D83a9f26A773D59ec7eCF30355e", mtlabi, 8]},
         {"DGD": ["0xe0b7927c4af23765cb51314a0e0521a9645f0e2a", dgdabi, 9]},
         {"SNT": ["0x744d70fdbe2ba4cf95131626614a1763df805b9e", sntabi, 18]},
         {"FUN": ["0x419d0d8bdd9af5e606ae2232ed285aff190e711b", funabi, 8]},
         {"SNGLS": ["0xaec2e87e0a235266d9c5adc9deb4b2e29b54d009", snglsabi, 0]},
         {"GNO": ["0x6810e776880c02933d47db1b9fc05908e5386b96", gnoabi, 18]},
         {"BNT": ["0x1f573d6fb3f13d689ff844b4ce37794d79a7ff1c", bntabi, 18]},
         {"ANT": ["0x960b236A07cf122663c4303350609A66A7B288C0", antabi, 18]},
         {"MLN": ["0xBEB9eF514a379B997e0798FDcC901Ee474B6D9A1", mlnabi, 18]},
         {"STORJ": ["0xb64ef51c888972c908cfacf59b47c1afbc0ab8ac", storjabi, 8]},
         {"CFI": ["0x12fef5e57bf45873cd9b62e9dbd7bfb99e32d73e", cfiabi, 18]},
         {"DNT": ["0x0abdace70d3790235af448c88547603b945604ea", dntabi, 18]}],
      vuecoins: [],
      addresses: [],
      newWallet: ""
    },

    mounted() {
        // this.loadWallets();
      $.get('/api/v1/wallets', function(data) {
        this.addresses = data.wallets;
        this.vuecoins = data.coins;
        this.getBalances();
        this.addSeen();
        this.displayCharts();
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
      getBalances() {
        var i = 0;
        for (let address of this.addresses) {
          address.coins = [];
          address.freq = {};
          for (let token of this.token_list) {
            var coin = web3.eth.contract(token[Object.keys(token)][1]).at(token[Object.keys(token)][0]);
            var x = token[Object.keys(token)][2];
            var z = Math.pow(10, x);
            var balance = coin.balanceOf(address.address) / parseFloat(z);
            if (balance > 0) {
              var current_price = parseFloat(this.addPrice(Object.keys(token)[0]));
              address.coins.push({ name: Object.keys(token)[0], value: balance, position_value: current_price * balance });
              address.freq[Object.keys(token)[0]] = current_price * balance;
            }
          }
          i++;
        }
        var i = 0
        for (let address of this.addresses) {
              var wei = web3.eth.getBalance(address.address);
              var balance = web3.fromWei(wei, 'ether');
              address['eth_balance'] = parseFloat(balance);
              address['eth_position_value'] = parseFloat(balance) * this.vuecoins[0].current_price;
              address.coins.push({ name: "ETH", position_value: address['eth_position_value']})
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

      toggleCoins(address) {
        address.seen = !address.seen;
      },

      getData() {
        var piedata = [];
        for (let coin of this.vuecoins) {
          piedata.push({});
        }
        var i = 0;
        for (let dic of piedata) {
          dic["name"] = this.vuecoins[i].ticker;
          dic["y"] = 0;
          i++;
        }

        for (let address of this.addresses) {
          // piedata["ETH"] += address.eth_position_value;
          for (let coin of address.coins) {
            for (let dic of piedata) {
              if (coin.name === dic.name) {
                dic["y"] += coin.position_value;
              }
            }
          }
        }   
        return piedata;
      },

      displayCharts() {
        Highcharts.chart('container', {
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: 'Token Breakdown'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                        style: {
                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                        }
                    }
                }
            },
            series: [{
                name: 'Brands',
                colorByPoint: true,
                data: this.getData()
            }]
        }); 
      },

      addWallet(addr) {
        var that = this;
        $.ajax({
          method: "POST",
          url: "/api/v1/wallets",
          headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') },
          data: { address: addr },
          success: function(result) {
            $.get('/api/v1/wallets', function(data) {
              that.addresses = data.wallets;
              that.vuecoins = data.coins;
              that.getBalances();
              that.addSeen();
              that.displayCharts();
            });
          }
        })
        
      },

      deleteWallet(addr) {
        var index = this.addresses.indexOf(addr);
        var that = this;

        $.ajax({
          url: `/api/v1/wallets/${addr.id}`,
          headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') },
          method: 'DELETE',
          success: function(result) {
            console.log('success', index, that.addresses)
            that.addresses.splice(index, 1)
          }
        });
      }

    }

  });
});