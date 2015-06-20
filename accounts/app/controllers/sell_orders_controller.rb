class SellOrdersController < ApplicationController
  def new
    @sell_order = SellOrder.new(:amount => 100000, :rate => 2500)
  end

  def create
    @sell_order = SellOrder.new(record_params)

    if @sell_order.save
      render json: @sell_order
    else
      render json: @sell_order.errors, status: :unprocessable_entity
    end
  end
  private
  def record_params
    params.require(:sell_order).permit(:amount, :rate)
  end
end
