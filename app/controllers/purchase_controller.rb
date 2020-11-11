class PurchaseController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :sold_out, only: :index
  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
    redirect_to root_path unless current_user.id != @item.user_id
  end
  

  def create 
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end
  
  private
  def purchase_address_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :municipality, :street_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_address_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out
    item = Item.find(params[:item_id])
    if item.purchase.present?
      redirect_to root_path
    end
  end

end

