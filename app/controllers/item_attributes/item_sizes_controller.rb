class ItemAttributes::ItemSizesController < ApplicationController
  def index
    item  = Item.find_by(token_id: params[:item_id])
    @item_sizes = ItemSize.where(item_id: item.id)
    render json: @item_sizes, each_serializer: ItemSizesSerializer
  end

  def create
    name = params[:name]
    code = params[:code]
    item_id = params[:item_id]
    size_id = params[:size_id]
    value = params[:value]

    item  = Item.find_by(token_id: item_id)

    new_size = ItemSize.new(
      name:,
      code:,
      item_id: item.id,
      size_id:,
      value:
    )

    if new_size.save
      render json: { message: 'size assigned successfully' }
    else
      render json: { message: 'Error while assigning a size to Item' }
    end
  end

  def update
    id = params[:id]
    image = params[:image]
    @item_size = ItemSize.find(id)
    @item_size.image.attach(image)

    if @item_size.image.attached?
      render json: { message: 'Image assigned sucessfully', id: @item_size.id }
    else
      render json: { message: 'Error while attaching Image', id: @item_size.id }
    end
  end

  def delete
    item_size = ItemSize.find(params[:id])

    if item_size.delete
      render json: { message: 'size deleted successfully' }
    else
      render json: { message: 'Error while deleting a size' }
    end
  end
end
