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

    # ##1: Stores
    get 'store/:user_id/api_stores', to: 'stores/stores#index'
    get 'store/:user_id/api_stores/:store_id', to: 'stores/stores#show'
    get 'store/:user_id/api_stores', to: 'stores/stores#new'
    post 'store/:user_id/api_stores/destroy', to: 'stores/stores#destroy'
    post 'store/update', to: 'stores/stores#update'
    post 'api_stores', to: 'stores/stores#create' # #new_store
  
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
  
    # ##9:Cart Items
    post 'carts', to: 'cart#index' ## => User_id , a Client
    post 'cart/new', to: 'cart#create' ## => required: cart_id, new_data
    post 'cart/destroy', to: 'cart#destroy' ## => required: cart_id
    post 'cart/update', to: 'cart#update' ## => required: cart_id, new_data
  
    # ##10:Google Places, Map
    post 'places', to: 'places#index'
    post 'place/new', to: 'places#create'
    post 'place/destroy', to: 'places#destroy'
    post 'place/update', to: 'places#update'
  
    # ##11:Orders
    post 'orders', to: 'orders#index'
    post 'orders/show', to: 'orders#create'
    post 'orders/destroy', to: 'orders#destroy'
    post 'orders/update', to: 'orders#update'

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

end
