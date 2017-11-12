// /* global Vue */
// document.addEventListener("DOMContentLoaded", function(event) { 
//   var app = new Vue({
//     el: '#app',
//     data: {
//       token_list: 
//         [{"OMG": ["0xd26114cd6EE289AccF82350c8d8487fedB8A0C07", omgabi]},
//          {"PAY": ["0xB97048628DB6B661D4C2aA833e95Dbe1A905B280", payabi]},
//          {"REP": ["0xe94327d07fc17907b4db788e5adf2ed424addff6", repabi]},
//          {"GNT": ["0xa74476443119A942dE498590Fe1f2454d7D4aC0d", gntabi]},
//          {"BAT": ["0x0d8775f648430679a709e98d2b0cb6250d2887ef", batabi]},
//          {"MTL": ["0xF433089366899D83a9f26A773D59ec7eCF30355e", mtlabi]},
//          {"DGD": ["0xe0b7927c4af23765cb51314a0e0521a9645f0e2a", dgdabi]},
//          {"SNT": ["0x744d70fdbe2ba4cf95131626614a1763df805b9e", sntabi]},
//          {"FUN": ["0x419d0d8bdd9af5e606ae2232ed285aff190e711b", funabi]},
//          {"SNGLS": ["0xaec2e87e0a235266d9c5adc9deb4b2e29b54d009", snglsabi]},
//          {"GNO": ["0x6810e776880c02933d47db1b9fc05908e5386b96", gnoabi]},
//          {"BNT": ["0x1f573d6fb3f13d689ff844b4ce37794d79a7ff1c", bntabi]},
//          {"ANT": ["0x960b236A07cf122663c4303350609A66A7B288C0", antabi]},
//          {"MLN": ["0xBEB9eF514a379B997e0798FDcC901Ee474B6D9A1", mlnabi]},
//          {"STORJ": ["0xb64ef51c888972c908cfacf59b47c1afbc0ab8ac", storjabi]},
//          {"CFI": ["0x12fef5e57bf45873cd9b62e9dbd7bfb99e32d73e", cfiabi]},
//          {"DNT": ["0x0abdace70d3790235af448c88547603b945604ea", dntabi]}],
//       addresses: document.getElementsByClassName('address'),
//       ethers: [],
//       cointotal: {},
//       seen: {},
//       coins: [],
//       wallets: []
//     },

//     mounted() {
//       // this.initWeb3();
//       this.getEtherBalance();
//       this.getSubtokenBalances();
//     },

//     methods: {

//       // initWeb3() {
//       //   var Web3 = require('web3');
//       //   var web3 = new Web3();
//       //   web3.setProvider(new web3.providers.HttpProvider("https://mainnet.infura.io/xDUJTvOvvpbDQhnvbIjj"));
//       // },

//       getEtherBalance() {
//         var i = 0
//         for (let address of this.addresses) {
//               var wei = web3.eth.getBalance(address.innerHTML);
//               var balance = web3.fromWei(wei, 'ether');
//               this.ethers.push(parseFloat(balance) + ' ' + 'ETH');
//               i++;
//         }
//       },

//       getSubtokenBalances() {
//         var i = 0;
//         for (let address of this.addresses) {
//           for (let token of this.token_list) {
//             var coin = web3.eth.contract(token[Object.keys(token)][1]).at(token[Object.keys(token)][0]);
//             var balance = coin.balanceOf(address.innerHTML) / parseFloat(1e16);
//             if (balance > 0) {
//               Vue.set(this.cointotal, i+Object.keys(token), parseFloat(balance) + ' ' + Object.keys(token));
//             }
//           }
//           i++;
//         }
//       },

//       // addWallet() {
//       //   // $.post('/wallets', { address: this.newWallerAddress})
//       // }

//       toggleBalances(arg) {
//         var i = 0;
//         for (let token of this.token_list) {
//           if (this.cointotal[arg+Object.keys(token)]){
//             Vue.set(this.seen, [arg+Object.keys(token)], !this.seen[arg+Object.keys(token)]);
//           }
//           i++;
//         }
//       }
//     }

//   });
// });