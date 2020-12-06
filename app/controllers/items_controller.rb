class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :item_find_id, only: [:show,:edit,:update,:destroy]

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
  end

  def edit
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
    end
    redirect_to action: :index
  end


  private

  def item_params
    params.require(:item).permit(
      :image, :name, :introduction, :category_id, :status_id, :charge_id, :prefecture_id, :term_id, :price
    ).merge(user_id: current_user.id)
  end

  def item_find_id
    @item = Item.find(params[:id])
  end

end
