class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update]
  before_action :authenticate_user! , except: [:index, :show]
  before_action :move_to_index, only: [:update, :edit, :destroy]
  
  def index
    @items = Item.includes(:user).order("created_at  DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def show
  end

  private
  
  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :load_id, :delivery_area_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if item.items_history.present?
      ridirect_to root_path
    end
  end

end
