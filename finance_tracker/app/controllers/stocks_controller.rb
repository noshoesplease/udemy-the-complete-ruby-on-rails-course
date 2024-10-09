# class StocksController < ApplicationController
#   def search
#     if params[:stock].present?
#       @stock = Stock.new_lookup(params[:stock])
#       if @stock
#         render "users/my_portfolio"
#       else
#         flash[:alert] = "Please enter a valid symbol to search"
#         redirect_to my_portfolio_path
#       end
#     else
#       flash[:alert] = "Please enter a symbol to search"
#       redirect_to my_portfolio_path
#     end
#   end
# end

class StocksController < ApplicationController
  def search
    stock_symbol = params[:stock].is_a?(Array) ? params[:stock].first : params[:stock]
    @stock = Stock.new_lookup(stock_symbol)

    if @stock
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("stock_results", partial: "users/result", locals: { stock: @stock }) }
        format.html { render "users/my_portfolio" }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("stock_results", partial: "users/result", locals: { stock: nil }) }
        format.html { redirect_to my_portfolio_path, alert: "Stock not found" }
      end
    end
  end
end
