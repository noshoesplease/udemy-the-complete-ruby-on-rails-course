class Stock < ApplicationRecord
  def self.new_lookup(ticker_symbol)
    finnhub_client = FinnhubRuby::DefaultApi.new
    current_price = finnhub_client.quote(ticker_symbol).c
    if current_price != 0
      new(
        ticker: ticker_symbol,
        name: finnhub_client.company_profile2({ symbol: ticker_symbol }).name,
        last_price: current_price
      )
    else
      nil
    end
  end
end
