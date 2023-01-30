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

    # ##1: Stores
    get 'api_stores', to: 'api_stores#index'
    post 'api_stores/show', to: 'api_store#show'
    get 'api_stores/create', to: 'api_stores#new'
    post 'api_stores/destroy', to: 'api_stores#destroy'
    post 'api_stores/update', to: 'api_stores#update'
    post 'api_stores', to: 'api_stores#create' # #new_store
  
    # ##2: Comments Store
    get 'api_stores/show/comments', to: 'store_comments#index' # #getlikes for Each
    get 'api_stores/show/comments/show', to: 'store_comments#show' ## show likes here
    post 'api_stores/show/comments/new', to: 'store_comments#create'
    post 'api_stores/show/comments/edit', to: 'store_comments#update'
    post 'api_stores/show/comments/destroy', to: 'store_comments#destroy'
  
    # ##3:Likes Store
    post 'api_stores/show/likes/new', to: 'store_likes#create'  ## create Store's likes here
    post 'api_stores/show/likes/edit', to: 'store_likes#update' ## Update Store's likes here
    post 'api_stores/show/likes/destroy', to: 'store_likes#destroy' ## Remove Store's likes here
  
    # ##4:Likes Comments for a Store
    post 'api_stores/show/comments/likes/new', to: 'comment_store_likes#create'  ## create Likes For Comment Store here
    post 'api_stores/show/comments/likes/edit', to: 'comment_store_likes#update' ## Update Likes For Comment Store here
    post 'api_stores/show/comments/likes/destroy', to: 'comment_store_likes#destroy' ## Remove Likes For Comment Store here
  
    # ##5:Items for a Store
    get 'api_stores/show/items', to: 'stores_items#index'
    post 'api_stores/show/items/details', to: 'stores_items#show'
    post 'api_stores/show/items/new', to: 'stores_items#new'
    post 'api_stores/show/items/destroy', to: 'stores_items#destroy'
    post 'api_stores/show/items/update', to: 'stores_items#update'
    post 'api_stores/show/items', to: 'stores_items#create'
  
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

end
