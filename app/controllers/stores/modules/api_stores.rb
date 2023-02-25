module ApiStore
    def save_store_details
        name = params[:name]
        description = params[:description]
        city = params[:city]
        user_id = params[:user_id]
        country_id = params[:country_id]
        @store = Store.new(
            name: name,
            description: description,
            location: city,
            user_id: user_id,
            country_id: country_id,
        )
        if @store.save
          render json: { message: 'created sucessfully', store_id: @store.id, step: 2 }
        else
          render json: { message: 'Failed to create store' }
        end
      end
  
      def save_store_categories
        @store_id = params[:store_id]
        categories = params[:categories].to_unsafe_h
        check_arr = []
        categories.each_with_index do |value, key|
           StoreCategory.create(
            store_id: @store_id,
            name: value[1][:name],
            store_categories_list_id: value[1][:id],
          )
           check_arr << 'check'
        end
  
        if  check_arr.length == categories.length
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
        render json: { message: 'Created successfully', store_id: params[:store_id], step: 5 }
      end  
end