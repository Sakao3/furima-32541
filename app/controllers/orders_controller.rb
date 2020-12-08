class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find

  def index
    @item_order=ItemOrder.new
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @item_order=ItemOrder.new(item_order_params)
    if @item_order.valid?

      pay_item

      @item_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def item_order_params
    params.require(:item_order).permit(
      :postal_code, :prefecture_id, :city, :block, :building, :telephone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_find
    @item=Item.find(params[:item_id])
  end



  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      card: item_order_params[:token],
      currency: 'jpy'
    )
  end


end

# @を付けて誤情報を送り、elseをrenderにしていると、エラーメッセージは出るが、情報が残る

# @を外して誤情報を送り、elseをredirectにしているとエラーメッセージはでないが情報は残らない
# →＠なしのrenderはビューにインスタンス変数を入れているためエラーが出る
