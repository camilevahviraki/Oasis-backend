class ItemAttributes::ItemColorsController < ApplicationController
  def index
    item  = Item.find_by(token_id: params[:item_id])
    @item_colors = ItemColor.where(item_id: item.id)
    render json: @item_colors, each_serializer: ItemColorsSerializer
  end

  def create
    name = params[:name]
    hex_code = params[:hex_code]
    token_id = params[:item_id]
    color_id = params[:id]

    item  = Item.find_by(token_id: token_id)

    new_color = ItemColor.new(
      name:,
      hex_code:,
      item_id: item.id,
      color_id:
    )

    if new_color.save
      render json: { message: 'collor assigned successfully' }
    else
      render json: { message: 'Error while assigning a collor to Item' }
    end
  end

  def update
    id = params[:id]
    image = params[:image]
    @item_colors = ItemColor.find(id)
    @item_colors.image.attach(image)

    if @item_colors.image.attached?
      render json: { message: 'Image assigned sucessfully', id: @item_colors.id }
    else
      render json: { message: 'Error while attaching Image', id: @item_colors.id }
    end
  end

  def delete
    item_color = ItemColor.find(params[:id])

    if item_color.delete
      render json: { message: 'collor deleted successfully' }
    else
      render json: { message: 'Error while deleting a collor' }
    end
  end
end
