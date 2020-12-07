class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order=Order.new
    @item=Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
  end

end
