class OrderItemsController < ApplicationController
	def create
		@order = current_order
		@order_item = @order.order_items.new(order_item_params)
		@order.save
		session[:order_id] = @order.id
		redirect_to carts_path
	end
	
	def update
		@order = current_order
		@order_item = @order.order_items.find(params[:id])
		@order_item.update_attributes(order_item_params)
		@order_items = @order.order_items
		redirect_to carts_path
	end

	def destroy
		@order = current_order
		@order_item = @order.order_items.find(params[:id])
		if @order_item.delete
			    respond_to do |format|
	    		 format.html { redirect_to carts_path }
	             format.js
	         end
	     end
	end

	private
		def order_item_params
			params.require(:order_item).permit(:product_id, :quantity, :size, :length)
		end
end