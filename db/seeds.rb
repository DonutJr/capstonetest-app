# Coin.create!([
#                   {ticker: "ETH", name: "Ether", current_price: 300, change: 0, marketcap:28537967, timestamp:"10-1-2017"},
#                   {ticker: "REP", name: "Augur", current_price: 20, change: 0, marketcap: 200000, timestamp:"10-1-2017"},
#                   {ticker: "DGD", name: "Digix", current_price: 80, change: 0, marketcap:160000, timestamp:"10-1-2017"},
#                   {ticker: "OMG", name: "Omise", current_price: 10, change: 0, marketcap:1000000, timestamp:"10-1-2017"},   
#             ])

Coin.create!([

              {"ticker": "ETH",
                "name": "Ether",
                "supply": "90000000"},
              {"ticker": "REP",
                "name": "Reputation",
                "supply": "11000000" },
              {"ticker": "DGD",
                "name": "Digix",
                "supply": "2000000" },
              {"ticker": "GNT",
                "name": "Golem",
                "supply": "1000000000" },
              {"ticker": "OMG",
                "name": "OmiseGO",
                "supply": "140245398" },
              {"ticker": "BAT",
                "name": "Basic Attention Token",
                "supply": "1500000000" }
            ])