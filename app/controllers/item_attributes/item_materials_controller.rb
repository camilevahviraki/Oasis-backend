class ItemAttributes::ItemMaterialsController < ApplicationController
  def index
    item = Item.find_by(token_id: params[:item_id])
    @item_colors = ItemMaterial.where(item_id: item.id)
    render json: @item_colors, each_serializer: ItemMaterialsSerializer
  end

  def create
    name = params[:name]
    code = params[:code]
    item_id = params[:item_id]
    material_id = params[:material_id]

    item = Item.find_by(token_id: item_id)

    new_material = ItemMaterial.new(
      name:,
      code:,
      item_id: item.id,
      material_id:
    )

    if new_material.save
      render json: { message: 'material assigned successfully' }
    else
      render json: { message: 'Error while assigning a material to Item' }
    end
  end

  def update
    id = params[:id]
    image = params[:image]
    @item_material = ItemMaterial.find(id)
    @item_material.image.attach(image)

    if @item_material.image.attached?
      render json: { message: 'Image assigned sucessfully', id: @item_material.id }
    else
      render json: { message: 'Error while attaching Image', id: @item_material.id }
    end
  end

  def delete
    item_material = ItemMaterial.find(params[:id])

    if item_material.delete
      render json: { message: 'material deleted successfully' }
    else
      render json: { message: 'Error while deleting a material' }
    end
  end
end
