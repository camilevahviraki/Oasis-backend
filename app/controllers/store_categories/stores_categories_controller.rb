class StoreCategories::StoresCategoriesController < ApplicationController
  def index
    store_id = params[:store_id]
    categories = StoreCategory.where(store_id:)

    render json: categories
  end

  def delete
    id = params[:id]
    category = StoreCategory.find(id)
    if category&.delete
      render json: { message: 'Deleted successfully' }
    else
      render json: { message: 'Error while deleting Item' }
    end
  end

  def create
    store_id = params[:store_id]
    category = params[:category]
    new_store_category = StoreCategory.new(
      store_id:,
      name: category[:name],
      store_categories_list_id: category[:id]
    )

    if new_store_category.save
      render json: { message: 'Added successfully', data: new_store_category }
    else
      render json: { message: 'Error while creating Item' }
    end
  end
end
