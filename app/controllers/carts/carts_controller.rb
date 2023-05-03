class Carts::CartsController < ApplicationController
    def index
      render json: []
    end

    def show
      user_id = params[:user_id]
      carts = Cart.where(user_id: user_id)
      render json: carts, each_serializer: CartSerializer 
    end
    
    def create
      user_id = params[:user_id]
      item_id = params[:item_id]
      store_id = params[:store_id]
      item_capacity = params[:item_capacity]
      item_color = params[:item_color]
      item_material = params[:item_material]
      item_size = params[:item_size]
      price = params[:price]
      quantity = params[:quantity]

      cart = Cart.new(
        user_id: user_id,
        item_id: item_id,
        store_id: store_id,
        item_capacity_id: item_capacity,
        item_color_id: item_color,
        item_material_id: item_material,
        item_size_id: item_size,
        quantity: quantity,
        price: price,
      )

      if cart.save
        render json: {message: "Item saved in cart successfully!"}
      else
        render json: {message: "Error while saving item in cart!"}
      end  
    end

    def update
      id = params[:id]
      quantity = params[:quantity]

      cart_item = Cart.find(id)
      if cart_item.update(quantity: quantity)
        render json: {message: "Quantity updated successfully!"}
      else
        render json: {message: "Error while updating quantity!"}
      end    
    end  
    
    def destroy
       id = params[:id]
       cart = Cart.find(id)
       if cart.destroy
        render json: {message: 'Cart Item deleted successfully!'}
       else
        render json: {message: 'Error while deleting Cart Item!'}
       end  
    end    
  end
