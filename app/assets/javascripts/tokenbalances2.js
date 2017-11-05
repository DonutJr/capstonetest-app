var token_list =
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
     {"DNT": ["0x0abdace70d3790235af448c88547603b945604ea", dntabi]}];


var Web3 = require('web3');
var web3 = new Web3();
web3.setProvider(new web3.providers.HttpProvider("https://mainnet.infura.io/xDUJTvOvvpbDQhnvbIjj"));

function padTokens(s, n) {
  var o = s.toPrecision(n);
  while (o.length < n) {
    o = " " + o;
  }
  return o;
}


function getTokenBalance() {
    var i = 0;
    var wallets = document.getElementsByClassName('wallets');
    for (let tok of token_list) {
        var coin = web3.eth.contract(tok[Object.keys(tok)][1]).at(tok[Object.keys(tok)][0]);
        var cointotal = 0;
       
        for (i = 0; i < wallets.length; i++) {
            var tokens = coin.balanceOf(wallets[i].innerHTML) / parseFloat(1e16);
            cointotal = parseFloat(tokens);
            if (cointotal > 0) {
                document.getElementById(wallets[i].id + "_" + Object.keys(tok)).innerHTML = cointotal + " " +Object.keys(tok);
            }
        }
    }
}

function toggleWallet(arg) {
    var lst = document.getElementsByClassName(arg+"_zero");
    var lst2 = document.getElementsByClassName(arg+"_zerobalance");
    var i = 0;
        for (let row of lst2) {
            if (row.innerHTML !== "") {
                $('.'+row.id+'_new').toggle();
            }
            i++;
        }   

}

function removeZeroBalance() {
    $('.hiding').hide();
}
    // var lst = document.getElementsByClassName('zerobalance');
    // var i = 0;
    // for (let row of lst) {
    //     if (row.innerHTML !== "") {
    //         $('.hiderow_'+ lst[i].id).show();
    //     }
        // i++;
    // }   

    // var lst = document.getElementsByClassName('zerobalance');
    // for(var i = 0; i < lst.length; ++i) {
    //     if (lst[i].innerHTML === "") {
    //         lst[i].style.display = "none";
    //     }
    // }


    // var lst = document.getElementsByClassName('zerobalance');
    // var i = 0;
    // for (let row of lst) {
    //     if (row.innerHTML === "") {
    //         $('.hiderow_'+ lst[i].id).hide();
    //     }
    //     i++;
    // }   


// function headerTest() {
//     $('table tr:not(.header)').hide();
//     $('.header').click(function() {
//         $(this).nextUntil('tr.header').slideToggle(300);
//     });
// }







