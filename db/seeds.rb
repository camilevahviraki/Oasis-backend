# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
      def create_item( names, main_name, store_id, pictures, price, description, quantity, shipping_options, category_name, store_token)
        new_item = Item.new(
          names:,
          main_name:,
          store_id:,
          price:,
          description:,
          quantity:,
          shipping_options:,
          category_name:,
          store_token:)
        
          if new_item.save
            img = ItemImage.create(item_id: new_item.id)
            pictures.each do |path|
              img.pictures.attach(io: File.open(Rails.root.join(path)), filename: main_name)
            end
          end  
      end  

      def create_currency(symbole, name, exchange, country)
        Currency.create!(
          symbole: symbole,
          name: name,
          exchange: exchange,
          country: country
        )
      end

      currencies_path = Rails.root.join('db/seeds_data/currencies.json')
      currencies_data = JSON.parse(File.read(currencies_path), symbolize_names: true)
      currencies_data.each do |currency_data|
        create_currency(
          currency_data[:symbole],
          currency_data[:name],
          currency_data[:exchange],
          currency_data[:country]
        )
      end

      stores_categories_list_path = Rails.root.join('db/seeds_data/stores_categories_list.json')
      stores_categories_list_data = JSON.parse(File.read(stores_categories_list_path), symbolize_names: true)
      stores_categories_list_data.each do |category_name|
          StoreCategoriesList.create!(name: category_name)
      end

      colors_list_path = Rails.root.join('db/seeds_data/colors.json')
      colors_list_data = JSON.parse(File.read(colors_list_path), symbolize_names: true)
      colors_list_data.each do |color|
          Color.create(name: color[:name], hex_code: color[:hex_code])
      end

      materials_list_path = Rails.root.join('db/seeds_data/materials.json')
      materials_list_data = JSON.parse(File.read(materials_list_path), symbolize_names: true)
      materials_list_data.each do |material|
          Material.create(name: material[:name], code: material[:code])
      end

      sizes_list_path = Rails.root.join('db/seeds_data/sizes_units.json')
      sizes_list_data = JSON.parse(File.read(sizes_list_path), symbolize_names: true)
      sizes_list_data.each do |size|
          Size.create(name: size[:name], code: size[:code])
      end

      capacities_list_path = Rails.root.join('db/seeds_data/capacities_units.json')
      capacities_list_data = JSON.parse(File.read(capacities_list_path), symbolize_names: true)
      capacities_list_data.each do |capacity|
          CapacityUnit.create(name: capacity[:name], code: capacity[:code])
      end


      countries_list_path = Rails.root.join('db/seeds_data/countries.json')
      countries_list_data = JSON.parse(File.read(countries_list_path), symbolize_names: true)
      countries_list_data.each do |country|
          Country.create(
            name: country[:name],
            country_code:  country[:country_code],
            currency_name:  country[:currency_name],
            currency_symbol:  country[:currency_symbol],
            exchange:  country[:exchange],
            latitude:  country[:latitude],
            longitude:  country[:longitude],
        )
      end

      user_path = Rails.root.join('db/seeds_data/users.json')
      user_data = JSON.parse(File.read(user_path), symbolize_names: true)
      user = User.new(user_data)
      if user.save
        image_path = Rails.root.join('db/seeds_data/images/user/user.png') 
        user.avatar.attach(io: File.open(image_path), filename: 'original-user.jpg', content_type: 'image/jpg')
      end

      store_path = Rails.root.join('db/seeds_data/stores.json')
      store_data = JSON.parse(File.read(store_path), symbolize_names: true)
      store_data.each do |store|
        new_store = Store.new(
        name: store[:name],
        location: store[:location],
        description: store[:description],
        country_id: store[:country_id],
        coordinates: store[:coordinates],
        user_id: user.id
        )
        if new_store.save
            store_image_path = Rails.root.join(store[:image]) 
            new_store.image.attach(io: File.open(store_image_path), filename: store[:name], content_type: 'image/jpg')
            store_imgs = StoreImage.create(store_id: new_store.id)
            store[:images_array].each do |path|
              store_imgs.pictures.attach(io: File.open(Rails.root.join(path)), filename: store[:name])
            end
            store[:categories].each do |store_cat|
               StoreCategory.create(
                name: store_cat[:name],
                store_id: new_store.id,
                store_categories_list_id: 1
               )
            end

            store[:items].each do |item|
              create_item(
                item[:names], 
                item[:main_name],
                new_store.id, 
                item[:pictures],
                item[:price], 
                item[:description], 
                item[:quantity], 
                item[:shipping_options], 
                item[:category_name],
                new_store.token_id
              )
            end  
  
        end
      end
