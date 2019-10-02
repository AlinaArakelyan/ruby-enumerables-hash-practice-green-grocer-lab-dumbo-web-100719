def consolidate_cart(cart)
#   new_cart = {}
#   cart.each do |items_array| 
#     items_array.each do |item, attribute_hash| 
#       new_cart[item] ||= attribute_hash 
#       new_cart[item][:count] ? new_cart[item][:count] += 1 :   
#       new_cart[item][:count] = 1 
#   end 
# end 
# new_cart 
final_hash = {}
cart.each do |element_hash|
  element_name = element_hash.keys[0]
  element_stats = element_hash.values[0]
  
  if final_hash.has_key?(element_name)
      final_hash[element_name][:count] += 1
  else
    final_hash[element_name] = {
      count: 1,
      price: element_stats[:price],
      clearance: element_stats[:clearance]
      
    }
end
end
final_hash
end


def apply_coupons(cart, coupons)
#   coupons.each do |coupon| 
#     coupon.each do |attribute, value| 
#       name = coupon[:item] 
    
#       if cart[name] && cart[name][:count] >= coupon[:num] 
#         if cart["#{name} W/COUPON"] 
#           cart["#{name} W/COUPON"][:count] += 1 
#         else 
#           cart["#{name} W/COUPON"] = {:price => coupon[:cost], 
#           :clearance => cart[name][:clearance], :count => 1} 
#         end 
  
#       cart[name][:count] -= coupon[:num] 
#     end 
#   end 
# end 
#   cart 

    coupons.each do |coupon|
      item = coupon[:item]
      if cart[item] && cart[item][:count] >= coupon[:num] && !cart["#{item} W/COUPON"]
        cart["#{item} W/COUPON"] = {price: coupon[:cost] / coupon[:num], clearance: cart[item][:clearance], count: coupon[:num] }
        cart[item] [:count] -= counpon[:num]
        elsif  cart[item][:count] >= coupon[:num] && cart["#{item} W/COUPON"]
        cart["#{item} W/COUPON"] [:count] -= coupon[:num]
      end
    end
      cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
