class StoreSales::StoreSalesController < ApplicationController
    def index
      render json: []
    end
  
    def show
      store_id = params[:store_id]
      data_filter = params[:dataFilter]
      store_sales = []
      if data_filter === 'today'
        store_sales = StoreSale.where(store_id: store_id).added_today
      elsif data_filter === 'this_week'
        store_sales = StoreSale.where(store_id: store_id).added_this_week
      elsif data_filter === 'past_month'
        store_sales = StoreSale.where(store_id: store_id).added_last_month
      elsif data_filter === 'this_month'
        store_sales = StoreSale.where(store_id: store_id).added_this_month
      elsif data_filter === 'range'
        start_date = params[:start_date]
        end_date = params[:end_date]
        re_sales = StoreSale.where(store_id: store_id).added_within_range(start_date, end_date)
      else
        store_sales = StoreSale.where(store_id: store_id).order(created_at: :desc)
      end  

      total_sales = StoreSale.where("DATE(created_at) = ?", Date.today).sum(:price_paid)
      products_created_today = StoreSale.where("DATE(created_at) = ?", Date.today).count
      render json: store_sales, each_serializer: StoreSaleSerializer, meta: { total_sales: total_sales, products_added_today: products_created_today }
    end

    def graph

        single_item = params[:singleItem]
        amount_per_date = params[:amountPerDate]
        item_id = params[:item_id]
        store_id = params[:store_id]
        
        result_array = []
        
        if single_item
          single_item_sales_per_date = StoreSale.where(item_id: item_id).group("DATE(created_at)").count(:quantity)
          result_array = single_item_sales_per_date.map do |date, count| {
              date: date,
              count: count}
          end
        elsif amount_per_date
          amount_sold_per_date = StoreSale.where(store_id: store_id).group("DATE(created_at)").sum(:price_paid)
          result_array = amount_sold_per_date.map do |date, count| {
            date: date,
            count: count}
          end
        else
          items_sold_per_date = StoreSale.where(store_id: store_id).group("DATE(created_at)").count(:quantity)
          result_array = items_sold_per_date.map do |date, count| {
            date: date,
            count: count}
          end
        end

       render json: result_array 
                               
    end  
  
    def create
      item_id = params[:item_id]
      store_id = params[:store_id]
      item_capacity = params[:item_capacity]
      item_color = params[:item_color]
      item_material = params[:item_material]
      item_size = params[:item_size]
      unit_price = params[:unit_price]
      price_paid = params[:price_paid]
      quantity = params[:quantity]
  
      store_sale = StoreSale.new(
        item_id:,
        store_id:,
        item_capacity_id: item_capacity,
        item_color_id: item_color,
        item_material_id: item_material,
        item_size_id: item_size,
        quantity:,
        price_paid:,
        unit_price:,
      )
      item = Item.find(item_id)
      item.update(quantity: (item.quantity - quantity))
  
      if store_sale.save
        render json: { message: 'Store Sale saved in StoreSale successfully!' }
      else
        render json: { message: 'Error while saving item in StoreSale!' }
      end
    end
  
    def update
      id = params[:id]
      quantity = params[:quantity]
  
      store_sale_item = StoreSale.find(id)
      if store_sale_item.update(quantity:)
        render json: { message: 'Quantity updated successfully!' }
      else
        render json: { message: 'Error while updating quantity!' }
      end
    end
  
    def destroy
      id = params[:id]
      store_sale = StoreSale.find(id)
      if store_sale.destroy
        render json: { message: 'StoreSale Item deleted successfully!' }
      else
        render json: { message: 'Error while deleting StoreSale Item!' }
      end
    end
  end
  