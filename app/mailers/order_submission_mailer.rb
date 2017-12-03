class OrderSubmissionMailer < ApplicationMailer
	default from: "from@example.com"
	#layout "ordersumit"

	def ordersumit(order_checkout, order)
		@order_checkout = order_checkout
		@order = order
	    mail( :to => "moussasarr490@gmail.com",
	    :subject => 'New Order from Maverick Innovations')
	  end

end
