module UpdateStore
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
      if @store.image.attached?
        @store.image.purge
        @store.image.attach(new_value)
      else
        @store.image.attach(new_value)
      end
    end
    render json: { message: "Updated #{field} correctly!" }
  end
end
