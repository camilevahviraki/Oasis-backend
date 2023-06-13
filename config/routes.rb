Rails.application.routes.draw do
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    ### User:
    # resources :users, only: %i[index show destroy update]
    
    devise_for :users,
    controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }

    # ##0: Home page
    get 'user/:user_id/home_page', to: 'home_page/home#index'
    post 'user/:user_id/home_page/search', to: 'home_page/home#search'

    # ##1: Stores
    get 'store/:user_id/api_stores', to: 'stores/stores#index'
    get 'store/:user_id/api_stores/:store_id', to: 'stores/stores#show'
    get 'store/:user_id/api_stores', to: 'stores/stores#new'
    post 'store/:user_id/api_stores/destroy', to: 'stores/stores#destroy'
    post 'store/update', to: 'stores/stores#update'
    post 'api_stores', to: 'stores/stores#create' # #new_store

    # ##1_1: Stores Places
    get 'places', to: 'stores/stores#places'
  
    # ##2: Comments Store
    get 'api_stores/show/comments', to: 'stores/comments#index' # #getlikes for Each
    get 'api_stores/show/comments/show', to: 'stores/comments#show' ## show likes here
    post 'api_stores/show/comments/new', to: 'stores/comments#create'
    post 'api_stores/show/comments/edit', to: 'stores/comments#update'
    post 'api_stores/show/comments/destroy', to: 'stores/comments#destroy'
  
    # ##3:Likes Store
    post 'api_stores/show/likes/new', to: 'stores/likes#create'  ## create Store's likes here
    post 'api_stores/show/likes/edit', to: 'stores/likes#update' ## Update Store's likes here
    post 'api_stores/show/likes/destroy', to: 'stores/likes#destroy' ## Remove Store's likes here
  
    # ##4:Likes Comments for a Store
    post 'api_stores/show/comments/likes/new', to: 'stores/comment_store_likes#create'  ## create Likes For Comment Store here
    post 'api_stores/show/comments/likes/edit', to: 'stores/comment_store_likes#update' ## Update Likes For Comment Store here
    post 'api_stores/show/comments/likes/destroy', to: 'stores/comment_store_likes#destroy' ## Remove Likes For Comment Store here
  
    # ##5:Items for a Store
    get 'api_stores/:store_id/items/:category', to: 'items/items#index'
    get 'api_stores/:store_id/item/:item_id', to: 'items/items#show'
    post 'api_stores/show/items/new', to: 'items/items#new'
    post '/api_stores/:store_id/items/:category/search', to: 'items/items#search'
    post 'api_stores/show/items/destroy', to: 'items/items#destroy'
    post 'api_stores/show/items/update', to: 'items/items#update'
    post 'api_stores/show/items', to: 'items/items#create'
  
    # ##6:Item comments
    post 'api_stores/show/items/comments', to: 'comments_item#index'
    post 'api_stores/show/items/comments/details', to: 'comments_item#show'
    post 'api_stores/show/items/comments/new', to: 'comments_item#new'
    post 'api_stores/show/items/comments/destroy', to: 'comments_item#destroy'
    post 'api_stores/show/items/comments/update', to: 'comments_item#update'
    post 'api_stores/show/items/comments/create', to: 'comments_item#create'
  
    # ##7:Likes for an Item
    post 'api_stores/show/item/likes', to: 'like_item#index'
    post 'api_stores/show/item/likes/new', to: 'like_item#create'
    post 'api_stores/show/item/likes/destroy', to: 'like_item#destroy'
    post 'api_stores/show/item/likes/update', to: 'like_item#update'
  
    # ##8:Item Comment Likes
    post 'api_stores/show/item/comment/likes', to: 'like_comment_item#index'
    post 'api_stores/show/item/comment/likes/new', to: 'like_comment_item#create'
    post 'api_stores/show/item/comment/likes/destroy', to: 'like_comment_item#destroy'
    post 'api_stores/show/item/comment/likes/update', to: 'like_comment_item#update'
  
    # ##9:Cart element
    get 'carts', to: 'carts/carts#index'
    get 'cart/:user_id', to: 'carts/carts#show' ## => User_id , a Client
    post 'cart/new', to: 'carts/carts#create' ## => required: cart_id, new_data
    delete 'cart/delete/:id', to: 'carts/carts#destroy' ## => required: cart_id
    post 'cart/update/:id', to: 'carts/carts#update'
    post 'cart/update', to: 'carts/carts#update' ## => required: cart_id, new_data
  
    # ##10:Google Places, Map
    post 'places', to: 'places#index'
    post 'place/new', to: 'places#create'
    post 'place/destroy', to: 'places#destroy'
    post 'place/update', to: 'places#update'
  
    # ##11:Orders
    get 'orders/:user_id', to: 'orders/orders#index'
    get 'orders/show/:token_id', to: 'orders/orders#show'
    post 'orders/new', to: 'orders/orders#create'
    post 'orders/:token_id/destination', to: 'orders/orders#destination'
    post 'orders/:token_id/create-payment-intent', to: 'orders/orders#create_payment_intent'
    post 'orders/:token_id/webhook', to: 'orders/orders#webhook'
    post 'orders/destroy', to: 'orders/orders#destroy'
    post 'orders/update', to: 'orders/orders#update'

      # ##11:Orders_Items
      post 'orders_items', to: 'orders_items/orders_items#index'
      post 'orders_items/show', to: 'orders_items/orders_items#create'
      post 'orders_items/destroy', to: 'orders_items/orders_items#destroy'
      post 'orders_items/update', to: 'orders_items/orders_items#update'

    # ##12:Users
    post 'users/list', to: 'get_users#index'
    post 'users/list/show', to: 'get_users#show'

    # ##13:Currency
    get 'currencies', to: 'currencies/currencies#index'
    get 'currency/:id', to: 'currencies/currencies#show'
    delete 'currency/:id', to: 'currencies/currencies#delete' ## for admin only
    put 'currency/:id', to: 'currencies/currencies#update' ## for admin only
    post 'currencies', to: 'currencies/currencies#create' ## for admin only

    # ##14:Country
    get 'countries', to: 'countries/countries#index'
    get 'country/:id', to: 'countries/countries#show'
    delete 'country/:id', to: 'countries/countries#delete' ## for admin only
    put 'country/:id', to: 'countries/countries#update' ## for admin only
    post 'countries', to: 'countries/countries#create' ## for admin only

    # ##15:Stores Categories List
    get 'stores_categories_list', to: 'categories_list/stores_categories_list#index'
    get 'stores_category_list/:id', to: 'categories_list/stores_categories_list#show'
    delete 'stores_category_list/:id', to: 'categories_list/stores_categories_list#delete' ## for admin only
    put 'stores_category_list/:id', to: 'categories_list/stores_categories_list#update' ## for admin only
    post 'stores_categories_list', to: 'categories_list/stores_categories_list#create' ## for admin only

    # ##16:Stores_categories
    get 'store/:store_id/stores_categories', to: 'store_categories/stores_categories#index'
    get 'stores_category/:id', to: 'store_categories/stores_categories#show'
    delete 'stores_category/:id', to: 'store_categories/stores_categories#delete'
    post 'stores_categories', to: 'store_categories/stores_categories#create'

    # ##17:store files_attachments
    get 'store/:store_id/images', to: 'stores/store_images#index'
    get 'store/:store_id/image/:id', to: 'stores/store_images#show'
    delete 'store_image/:id', to: 'stores/store_images#delete'
    post 'store/:store_id/image', to: 'stores/store_images#create'

    # ##18:Item Colors
    get 'item/:item_id/colors', to: 'item_attributes/item_colors#index'
    get 'item/:item_id/colors/:id', to: 'item_attributes/item_colors#show'
    post 'item/:item_id/colors/:id/image', to: 'item_attributes/item_colors#update'
    delete 'item/:item_id/colors/:id', to: 'item_attributes/item_colors#delete'
    post 'item/:item_id/colors', to: 'item_attributes/item_colors#create'

    # ##19:Item materials
    get 'item/:item_id/materials', to: 'item_attributes/item_materials#index'
    get 'item/:item_id/materials/:id', to: 'item_attributes/item_materials#show'
    post 'item/:item_id/materials/:id/image', to: 'item_attributes/item_materials#update'
    delete 'item/:item_id/materials/:id', to: 'item_attributes/item_materials#delete'
    post 'item/:item_id/materials', to: 'item_attributes/item_materials#create'

    # ##20:Item sizes
    get 'item/:item_id/sizes', to: 'item_attributes/item_sizes#index'
    get 'item/:item_id/sizes/:id', to: 'item_attributes/item_sizes#show'
    post 'item/:item_id/sizes/:id/image', to: 'item_attributes/item_sizes#update'
    delete 'item/:item_id/sizes/:id', to: 'item_attributes/item_sizes#delete'
    post 'item/:item_id/sizes', to: 'item_attributes/item_sizes#create'

    # ##21:Item capacity
    get 'item/:item_id/capacity', to: 'item_attributes/item_capacities#index'
    get 'item/:item_id/capacity/:id', to: 'item_attributes/item_capacities#show'
    post 'item/:item_id/capacity/:id/image', to: 'item_attributes/item_capacities#update'
    delete 'item/:item_id/capacity/:id', to: 'item_attributes/item_capacities#delete'
    post 'item/:item_id/capacity', to: 'item_attributes/item_capacities#create'

    # ##22:Capacity
    get 'capacity', to: 'attributes/capacities#index'
    get 'capacity/:id', to: 'attributes/capacities#show'
    delete 'capacity/:id', to: 'attributes/capacities#delete'
    post 'capacity', to: 'attributes/capacities#create'

    # ##23:Size
    get 'size', to: 'attributes/sizes#index'
    get 'size/:id', to: 'attributes/sizes#show'
    delete 'size/:id', to: 'attributes/sizes#delete'
    post 'size', to: 'attributes/sizes#create'

    # ##24:Material
    get 'material', to: 'attributes/materials#index'
    get 'material/:id', to: 'attributes/materials#show'
    delete 'material/:id', to: 'attributes/materials#delete'
    post 'material', to: 'attributes/materials#create'

    # ##25:Color
    get 'color', to: 'attributes/colors#index'
    get 'color/:id', to: 'attributes/colors#show'
    delete 'color/:id', to: 'attributes/colors#delete'
    post 'color', to: 'attributes/colors#create'

    # ##26:Search Suggestion
    get 'user/:user_id/search_suggestions', to: 'search_suggestions/search_suggestions#index'
    delete 'user/:user_id/search_suggestions/:id', to: 'search_suggestions/search_suggestions#delete'
    post 'user/:user_id/search_suggestion/new', to: 'search_suggestions/search_suggestions#create'
    post 'user/:user_id/search_suggestion/search', to: 'search_suggestions/search_suggestions#search'
end
