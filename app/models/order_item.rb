class OrderItem < ApplicationRecord
	belongs_to :order
	belongs_to :product
	before_save :set_unit_price
	before_save :set_total_price



	def unit_price
		
		if persisted?
			self[:unit_price]
		else
			if product
				cat = product.category
	            case cat
				when "Hose Assemblies"
					case size 
					when 1
						return product.base_price_one.to_f + product.additional_foot_price.to_f * (length-1)  
					when 1.5
						return product.base_price_oneofive + product.additional_foot_price.to_f * (length -1)
					when 2
						return product.base_price_two + product.additional_foot_price.to_f * (length-1) 
					when 2.5
						return product.base_price_twofive + product.additional_foot_price.to_f * (length-1)
					when 3
						return product.base_price_three + product.additional_foot_price.to_f * (length-1)
					when 3.5
					when 4
						return product.base_price_four.to_f + product.additional_foot_price.to_f * (length-1)
					else
						return product.base_price_one  + product.additional_foot_price.to_f * (length-1)
					end
						
				 return product.price_per_size.to_f * size + product.additional_foot_price.to_f * (length-1)    # +  Price of END1 + Price of END2

					when "Doughnuts", "Couplings", "Supermax"
						case size 
						when 1
							return product.base_price_one.to_f 
						when 1.5
							return product.base_price_oneofive.to_f
						when 2
							return product.base_price_two.to_f 
						when 2.5
							return product.base_price_twofive.to_f
						when 3
							return product.base_price_three.to_f 
						when 4
							return product.base_price_four.to_f 
		                else 
		                	return product.base_price_one.to_f 
						end
					else
	                    return product.constant_price.to_f.to_f 
				    end
		    end	
		end
	end

	def total_price
		unit_price * quantity
	end

	def set_unit_price
		self[:unit_price] = unit_price
    end
    def set_total_price
    	self[:total_price] = quantity * set_unit_price
    end
end
