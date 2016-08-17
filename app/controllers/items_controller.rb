class ItemsController < ApplicationController
  def create
    if session[:character_id]
      params.permit(:item_name)
      Item.create(name: params[:item_name], character_id: session[:character_id])
    end
  end

  def use_item
    if session[:character_id]
      params.permit(:item_name)
      Item.where(name: params[:item_name], character_id: session[:character_id]).first.destroy
    end
  end
end
