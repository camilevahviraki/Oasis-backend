module UpdateStore
   def update_field( store_id, field, new_value )
      @store = Store.find( store_id )

      if field == 'name'
         @store.update_column(:name, new_value)
      elsif field == 'location'
        @store.update_column(:location, new_value)
      elsif field == 'open-from'
        @store.update_column(:open-from, new_value)
      elsif field == 'description'
        @store.update_column(:description, new_value)
      elsif field == 'info'
        @store.update_column(:info, new_value)
      elsif field == 'country_id'  
        @store.update_column(:country_id, new_value)
      end 
      
      render json: {message: "Updated #{field} correctly!"}

   end
end    