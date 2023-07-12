class Stores::StoresController < ApplicationController
  # before_action :authenticate_user!

  def index
    @stores = Store.where(user_id: params[:user_id])
    render json: @stores, each_serializer: ApiStoresSerializer
  end

  def show
    @store = Store.find_by(token_id: params[:store_id])
    render json: @store, serializer: ApiStoresSerializer
  end

  def places
    stores = Store.all
    render json: stores, each_serializer: StorePlacesSerializer
  end

  def create
    @step = params[:step]
    case @step
    when '1'
      save_store_details
    when '2'
      save_store_categories
    when '3'
      save_store_pictures
    when '4'
      save_store_places
    else
      render json: { message: 'Missing or uncorrect step parameter!' }
    end
  end

  def update
    @field = params[:field]
    @store_id = params[:store_id]
    @new_value = params[:new_value]

    update_field(@store_id, @field, @new_value)
  end

  def update_field(store_id, field, new_value)
    @store = Store.find(store_id)

    case field
    when 'name'
      @store.update_column(:name, new_value)
    when 'location'
      @store.update_column(:location, new_value)
    when 'open-from'
      @store.update_column(:open_from, new_value)
    when 'description'
      @store.update_column(:description, new_value)
    when 'info'
      @store.update_column(:info, new_value)
    when 'country_id'
      @store.update_column(:country_id, new_value)
    when 'main_image'
      @store.image.purge if @store.image.attached?
      @store.image.attach(new_value)
    end
    render json: { message: "Updated #{field} correctly!" }
  end

  def save_store_details
    name = params[:name]
    description = params[:description]
    city = params[:city]
    user_id = params[:user_id]
    country_id = params[:country_id]
    @store = Store.new(
      name:,
      description:,
      location: city,
      user_id:,
      country_id:
    )
    if @store.save
      @store.image.attach(params[:image])
      if @store.image.attached?
        render json: { message: 'created sucessfully', store_id: @store.id, step: 2 }
      else
        render json: { message: 'Error while attaching image', store_id: @store.id, step: 2 }
      end
    else
      render json: { message: 'Failed to create store' }
    end
  end

  def save_store_categories
    @store_id = params[:store_id]
    categories = params[:categories].to_unsafe_h
    check_arr = []
    categories.each_with_index do |value, _key|
      StoreCategory.create(
        store_id: @store_id,
        name: value[1][:name],
        store_categories_list_id: value[1][:id]
      )
      check_arr << 'check'
    end

    if check_arr.length == categories.length
      render json: { message: 'created sucessfully', store_id: @store_id, step: 3 }
    else
      render json: { message: 'Failed to create store' }
    end
  end

  def save_store_pictures
    @store = Store.find(params[:store_id])
    @store_image = StoreImage.create(store_id: params[:store_id]) # file_type: params[:fyle_type]
    @store_image.pictures.attach(params[:images])

    if @store_image.pictures.attached?
      render json: { message: 'Created successfully', store_id: params[:store_id], step: 4 }
    else
      render json: { message: 'Creation failed, Please check your params!' }
    end
  end

  def save_store_places
    @store_id = params[:store_id]
    coordinates = params[:places]

    store = Store.find(@store_id)

    if coordinates && store.update(coordinates: coordinates.to_json)
      render json: { message: 'Created successfully', store_id: params[:store_id], step: 5 }
    else
      render json: { message: 'Params error, Or did not provided coordinates', store_id: params[:store_id], step: 5 }
    end
  end
end
