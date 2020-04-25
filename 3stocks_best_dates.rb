=begin
Implement a method #stock_picker that takes in an array of stock prices, 
one for each hypothetical day. It should return a pair of days representing 
the best day to buy and the best day to sell. Days start at 0.
=end


def stock_picker(stock_prices)
  # stock_prices[buy_date] = buy price 
  # max_profit[buy_date] = max profit possible if bought on buy_date
  # sell_date[buy_date] = date to sell stock to get max_profit

  max_profit = []
  sell_date = []

  stock_prices.each_with_index do |buy_price, buy_date|
    max_sell_price = stock_prices[buy_date..-1].max
    max_profit[buy_date] = max_sell_price - buy_price
    sell_date[buy_date] = stock_prices.find_index(max_sell_price)
  end

  best_buy_date = max_profit.find_index(max_profit.max)
  best_sell_date = sell_date[best_buy_date]
  [ best_buy_date, best_sell_date ]    
end


p stock_picker([17,3,6,9,15,8,6,1,10])
# [1,4]  # for a profit of $15 - $3 == $12

