class Items::ItemsController < ApplicationController
  def index
    # category_id = params[:category_id]
    # category = params[:category]
    store_id = params[:store_id]

    #  data =  Item.left_outer_joins(:item_categories)
    #     .select('items.*, item_categories.*, item_categories.id as category_id')
    #     .where("items.store_id = #{store_id}")
    #  .where("item_categories.name = #{category}")
    data = Item.where(store_id:)

    render json: data, each_serializer: ItemSerializer
  end

  def show
    item_id = params[:item_id]

    item = Item.find(item_id)

    render json: item, serializer: ItemSerializer
  end

  def create
    store_id = params[:store_id]
    description = params[:description]
    pictures = params[:pictures]
    main_name = params[:mainName]
    names = params[:names]
    price = params[:price]
    quantity = params[:quantity]

    @item = Item.new(
      store_id:,
      description:,
      mainName: main_name,
      names:,
      price:,
      quantity:
    )

    category = ItemCategoriesList.where(name: params[:category])[0]

    if @item.save
      unless params[:category].nil? || params[:category] == 'all'
        ItemCategory.create(
          name: params[:category],
          item_id: @item.id,
          item_categories_list_id: category.id
        )
      end

      @item_image = ItemImage.create(item_id: @item.id)

      @item_image.pictures.attach(pictures)

      if @item_image.pictures.attached?
        render json: { message: 'created sucessfully', item_id: @item.id }
      else
        render json: { message: 'Error while attaching Images', item_id: @item.id }
      end
    else
      render json: { message: 'Failed to create store' }
    end
  end
end
