/* global Vue */
document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      addresses: document.getElementsByClassName('address'),
      ethers: [],
      cointotal: [],
      seen: {}
    },

    mounted() {
      this.getEtherBalance();
      this.getSubtokenBalances();
      // this.initHide();
    },

    methods: {
      getEtherBalance() {
        var i = 0
        for (let address of this.addresses) {
              var wei = web3.eth.getBalance(address.innerHTML);
              var balance = web3.fromWei(wei, 'ether');
              this.ethers.push(parseFloat(balance) + ' ' + 'ETH');
              i++;
        }
      },

      getSubtokenBalances() {
        var i = 0;
        for (let address of this.addresses) {
          for (let token of token_list) {
            var coin = web3.eth.contract(token[Object.keys(token)][1]).at(token[Object.keys(token)][0]);
            var balance = coin.balanceOf(address.innerHTML) / parseFloat(1e16);
            if (balance > 0) {
              this.cointotal[i] = parseFloat(balance) + ' ' + Object.keys(token);
            }
            i++;
          }
        }
      },

      initHide () {
        // var i = 0;
        // var j = 0;
        // for (let address of this.addresses) {
        //   for (let token of token_list) {
        //     this.seen[j + Object.keys(token)] = false;
        //     i++;
        //   }
        //   j++;
        // }


      },

      toggleBalances(arg) {
        var i = 0;
        for (let token of token_list) {
          Vue.set(this.seen, [arg+Object.keys(token)], !this.seen[arg+Object.keys(token)]  );
          // this.seen[arg+Object.keys(token)] = !this.seen[arg+Object.keys(token)];

          i++;
        }
      }
    }



  });
});