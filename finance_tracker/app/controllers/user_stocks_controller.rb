class UserStocksController < ApplicationController
  def create
    stock = Stock.check_db(params[:ticker])
    if stock.blank?
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)

    respond_to do |format|
      format.turbo_stream do
        flash.now[:notice] = "Stock #{stock.name} was successfully added to your portfolio"
        # Target the correct tbody
        render turbo_stream: turbo_stream.append("tracked_stocks_body", partial: "stocks/stock_row", locals: { stock: stock })
      end
      format.html { redirect_to my_portfolio_path, notice: "Stock #{stock.name} was successfully added to your portfolio" }
    end
  end

  def destroy
    stock = Stock.find(params[:id])
    user_stock = current_user.user_stocks.find_by(stock: stock)
    user_stock.destroy

    respond_to do |format|
      format.turbo_stream do
        flash.now[:notice] = "Stock #{stock.name} was removed from your portfolio"
        # Remove the row for the deleted stock
        render turbo_stream: turbo_stream.remove("stock-#{stock.id}")
      end
      format.html { redirect_to my_portfolio_path, notice: "Stock #{stock.name} was removed from your portfolio" }
    end
  end
end
