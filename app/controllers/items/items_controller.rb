class Items::ItemsController < ApplicationController
  def index
    category = params[:category]
    store_id = params[:store_id]

    data = []
    store = Store.find_by(token_id: store_id)
    if store
      data = if params[:category].nil? || params[:category] == 'all'
               Item.where(store_id: store.id)
             else
               Item.where(store_id: store.id, category_name: category)
             end
    end
    render json: data, each_serializer: ItemSerializer
  end

  def show
    item_id = params[:item_id]

    item = Item.find_by(token_id: item_id)

    render json: item, serializer: ItemSerializer
  end

  def update_quantity
    item_id = params[:item_id]
    quantity = params[:quantity]

    item = Item.find_by(token_id: item_id)

    if item.update(quantity: quantity.to_i)
      render json: {message: "Updated successfully"}
    else
      render json: {message: "Error updating quantity"}
    end
  end

  def create
    store_id = params[:store_id]
    description = params[:description]
    pictures = params[:pictures]
    main_name = params[:mainName]
    names = params[:names]
    price = params[:price]
    quantity = params[:quantity]
    category_name = params[:category]

    @item = Item.new(
      store_id:,
      description:,
      main_name:,
      names:,
      price:,
      quantity:,
      category_name:
    )

    category = ItemCategoriesList.where(name: params[:category])[0]

    if @item.save
      # unless params[:category].nil? || params[:category] == 'all'
      #   ItemCategory.create(
      #     name: params[:category],
      #     item_id: @item.id,
      #     item_categories_list_id: category.id
      #   )
      # end

      @item_image = ItemImage.create(item_id: @item.id)

      @item_image.pictures.attach(pictures)

      if @item_image.pictures.attached?
        render json: { message: 'created sucessfully', item_id: @item.token_id }
      else
        render json: { message: 'Error while attaching Images', item_id: @item.token_id }
      end
    else
      render json: { message: 'Failed to create store' }
    end
  end

  def search
    store_id = params[:store_id]
    category = params[:category]
    query = params[:query]

    data = []
    data = if params[:category].nil? || params[:category] == 'all'
             Item.where(store_id:).where(
               'lower(main_name) LIKE :search OR lower(names) LIKE :search OR lower(description) LIKE :search ',
               search: "%#{query.downcase}%"
             )
           else
             Item.where(store_id:, category_name: category).where(
               'lower(main_name) LIKE :search OR lower(names) LIKE :search OR lower(description) LIKE :search ',
               search: "%#{query.downcase}%"
             )
           end

    render json: data, each_serializer: ItemSerializer
  end

  def mass_delete
    ids = params[:ids]

    ids.each do |id|
      product = Item.find_by(id: id)
      product.destroy if product
    end
    
    render json: {message: 'Items deleted successfully' }
  end
end
