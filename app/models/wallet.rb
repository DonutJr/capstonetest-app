class Wallet < ApplicationRecord
  belongs_to :user
  
  validates :address, presence: true

  def get_eth_balance
    Unirest.get("https://api.etherscan.io/api?module=account&action=balance&address=#{address}&tag=latest").body['result'].to_f / 1000000000000000000
  end


  


  # <tbody>
  #                 <% @wallets.each do |wallet| %>

  #                     <tr>
  #                       <th scope="row"><%=  %></th>
  #                       <td><div id="wallet_<%= wallet.id %>" class="wallets"><%= wallet.address %></div></td>
  #                       <td><div id="wallet_<%= wallet.id %>output"></div></td>
  #                       <td><%= wallet.get_eth_balance * @eth.current_price %></td>
  #                       <td>
  #                           <div class="btn-group" role="group" aria-label="Basic example">
  #                           <%= link_to "delete", "/wallets/#{ wallet.id }", method: :delete, class: "btn btn-primary btn-rounded" %></td> 
  #                           </div>
  #                     </tr>

  #                 <% end %>
  #               </tbody>


  
end
