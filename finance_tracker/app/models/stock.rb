class Stock < ApplicationRecord
  def self.new_lookup(ticker_symbol)
    Alphavantage::TimeSeries.new(symbol: ticker_symbol).quote.price.to_f
  end
end
