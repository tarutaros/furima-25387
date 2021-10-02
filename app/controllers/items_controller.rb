class ItemsController < ApplicationController
  before_action :authenticate_user! , except: [:index, :show]

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

  # def edit
  #   @item = Item.find_by(id: params[:id])
  # end

  def show
    @item =Item.find_by(id: params[:id])

  end

  private
  
  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :load_id, :delivery_area_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end
end
