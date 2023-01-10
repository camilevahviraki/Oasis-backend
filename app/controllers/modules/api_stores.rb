module ApiStore
    def save_store_details
        name = params[:name]
        description = params[:description]
        country = params[:country]
        city = params[:city]
        user_id = params[:user_id]
        @store = Store.new(
            name: name,
            country: country,
            description: description,
            location: city,
            user_id: 1,
        )
        if @store.save
          render json: { message: 'created sucessfully', store_id: @store.id }
        else
          render json: { message: 'Failed to create store' }
        end
      end
  
      def save_store_categories
        @store_id = params[:store_id]
        categories = params[:categories].to_unsafe_h
        check_arr = []
        categories.each_with_index do |value, key|
           StoreCategory.create(store_id: @store_id, name: value[1][:name], store_categories_list_id: value[1][:id])
           check_arr << 'check'
        end
  
        if  check_arr.length == categories.length
          render json: { message: 'created sucessfully', store_id: @store_id }
        else
          render json: { message: 'Failed to create store' }
        end
      end

      def save_store_pictures
        @store = Store.find(params[:store_id])
        @store_image = StoreImage.create(store_id: params[:store_id]) # file_type: params[:fyle_type]
        @store_image.pictures.attach(params[:images])

        if @store_image.pictures.attached?
          render json: { message: 'Created successfully', store_id: params[:store_id] }
        else
          render json: { message: 'Creation failed, Please check your params!' }
        end
      end
end