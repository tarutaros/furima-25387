class DestinationsController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!
  before_action :move_to_index, only: [:index, :create]

  def index
    @history_destination = HistoryDestination.new
  end

  def create
    @history_destination = HistoryDestination.new(destination_params)
    if @history_destination.valid?
      pay_item
      @history_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def destination_params
    params.require(:history_destination).permit(:post_code, :delivery_area_id, :city, :address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: destination_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if @item.items_history.present? || current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
