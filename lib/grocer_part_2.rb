require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    current_item = find_item_by_name_in_collection(coupon[:item], cart)
    if current_item && current_item[:count] >= coupon[:num]
        cart << {:item => current_item[:item] + " W/COUPON", :price => coupon[:cost]/coupon[:num], 
        :clearance => current_item[:clearance], :count => coupon[:num]
        }
        current_item[:count] -= coupon[:num]
    end
  end
  cart
end


def apply_clearance(cart)
   #binding.pry
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  cart.each do |cart_item| 
    #.pry
    if cart_item[:clearance] == true 
      cart_item[:price] = cart_item[:price] - (cart_item[:price] * 0.20) 
    end 
  end 
end

def checkout(cart, coupons)
  grand_total = 0
  # binding.pry
    consolidated_cart = consolidate_cart(cart)
    # binding.pry
    applied_coupons = apply_coupons(consolidated_cart, coupons)
    # binding.pry 
    applied_discounts = apply_clearance(consolidated_cart)
    # binding.pry
      applied_discounts.each do |discount_item|
        # binding.pry
          grand_total = grand_total + discount_item[:price] * discount_item[:count]
            #binding.pry
      end   
      if grand_total >= 100 
        grand_total = grand_total - (grand_total * 0.10)
      end 
      grand_total
# end 
end









# Consult README for inputs and outputls
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers