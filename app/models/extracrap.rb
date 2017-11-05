# def token_balance(token)
    # token_list =
    # {"OMG": "0xd26114cd6EE289AccF82350c8d8487fedB8A0C07",
    #  "PAY": "0xB97048628DB6B661D4C2aA833e95Dbe1A905B280",
    #  "REP": "0xe94327d07fc17907b4db788e5adf2ed424addff6",
    #  "GNT": "0xa74476443119A942dE498590Fe1f2454d7D4aC0d",
    #  "BAT": "0x0d8775f648430679a709e98d2b0cb6250d2887ef",
    #  "KNC": "0xdd974d5c2e2928dea5f71b9825b8b646686bd200",
    #  "MTL": "0xF433089366899D83a9f26A773D59ec7eCF30355e",
    #  "DGD": "0xe0b7927c4af23765cb51314a0e0521a9645f0e2a",
    #  "ICN": "0x888666CA69E0f178DED6D75b5726Cee99A87D698",
    #  "ZRX": "0xe41d2489571d322189246dafa5ebde1f4699f498",
    #  "SNT": "0x744d70fdbe2ba4cf95131626614a1763df805b9e",
    #  "FUN": "0x419d0d8bdd9af5e606ae2232ed285aff190e711b",
    #  "SNGLS": "0xaec2e87e0a235266d9c5adc9deb4b2e29b54d009",
    #  "GNO": "0x6810e776880c02933d47db1b9fc05908e5386b96",
    #  "BNT": "0x1f573d6fb3f13d689ff844b4ce37794d79a7ff1c",
    #  "ANT": "0x960b236A07cf122663c4303350609A66A7B288C0",
    #  "MLN": "0xBEB9eF514a379B997e0798FDcC901Ee474B6D9A1",
    #  "STORJ": "0xb64ef51c888972c908cfacf59b47c1afbc0ab8ac",
    #  "CFI": "0x12fef5e57bf45873cd9b62e9dbd7bfb99e32d73e",
    #  "TRST": "0xcb94be6f13a1182e4a4b6140cb7bf2025d28e41b",
    #  "DNT": "0x0abdace70d3790235af448c88547603b945604ea"}


    # def get_token_balance(coin)
  #   res = Unirest.get("https://api.etherscan.io/api?module=account&action=tokenbalance&contractaddress=#{coin.contract_address}&address=#{self.address}&tag=latest").body['result'].to_f / 1000000000000000000
  #   return " #{coin.ticker}: #{res}" if res > 0
  # end

  #   Unirest.get("https://api.etherscan.io/api?module=account&action=tokenbalance&contractaddress=#{}&address=#{address}&tag=latest").body['result'].to_f / 1000000000000000000
  # end

  #   <% @coins.each do |coin| %>
  #   <h2> <%= @wallets.last.get_token_balance(coin) %></h2>
  # <% end %>

   # <h2 class="marginslol"><script>getcoinsBalance()</script></h2>

   # <script>showBalance(document.getElementsByTagName('td').getElementById("wallet_10").innerHTML);</script>

  #  <%= content_tag_for(:tr, @wallets) do |wallet| %>
  #   <td><%= wallet.address %></td>
  # <% end %>

  # // var wallets = document.getElementsByClassName('wallets');
  #   // for (i = 0; i < wallets.length; i++) {
  #   //     try {
  #   //         var wei = web3.eth.getBalance(wallets[i].innerHTML);
  #   //         var balance = web3.fromWei(wei, 'ether');
  #   //         document.getElementById(wallets[i].id + "omg").innerHTML = balance + "ETH";
  #   //     }
  #   //     catch (err) {
  #   //         document.getElementById(wallets[i] + "omg").innerHTML = err.message;
  #   //     }
  #   // 

   # // var omgaddress = "0xd26114cd6EE289AccF82350c8d8487fedB8A0C07";
   #  // var omg = web3.eth.contract(omgabi).at(omgaddress);
   #  // var omgtotal = 0;
   #  // var i =0; 
   #  // var wallets = document.getElementsByClassName('wallets');
   #  // for (i = 0; i < wallets.length; i++) {
   #  //     var tokens = omg.balanceOf(wallets[i].innerHTML) / parseFloat(1e16);
   #  //     omgtotal = parseFloat(tokens);
   #  //     document.getElementById(wallets[i].id + "omg").innerHTML = omgtotal + "omg"
   #  // }  

