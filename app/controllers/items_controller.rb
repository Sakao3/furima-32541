class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]

  def index
    @items = Item.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to action: :show
  end


  private

  def item_params
    params.require(:item).permit(
      :image, :name, :introduction, :category_id, :status_id, :charge_id, :prefecture_id, :term_id, :price
    ).merge(user_id: current_user.id)
  end

end
