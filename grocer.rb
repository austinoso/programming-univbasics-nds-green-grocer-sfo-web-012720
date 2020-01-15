def find_item_by_name_in_collection(name, collection)
    i = 0
    while i < collection.length do
        if collection[i][:item] == name
          return collection[i]
        end
        i += 1
    end
nil
end

def consolidate_cart(cart)

  new_cart = []
  i = 0

  while i < cart.length do

    if !find_item_by_name_in_collection(cart[i][:item], new_cart)

      new_cart << {
        :item => cart[i][:item],
        :price => cart[i][:price],
        :clearance => cart[i][:clearance],
        :count => 1
      }

    else

      new_cart_i = 0
      while new_cart_i < new_cart.length do

        if new_cart[new_cart_i][:item] == cart[i][:item]

          new_cart[new_cart_i][:count] += 1

        end

        new_cart_i += 1

      end
    end

    i += 1
  end

new_cart
end

def apply_coupons(cart, coupons)

  applied_coupons = []
  cart_i = 0
  coupons_i = 0

  while cart_i < cart.length do

    if cart[cart_i][:item] == coupons[coupons_i]

      while cart[cart_i][:count] >= coupons[coupons_i][:num] do

        apply_coupons << {

        :item => "#{cart[cart_i][:item]} W/COUPON",
        :price => coupons[coupons_i][:cost] / coupons[coupons_i][:num],
        :clearance => cart[cart_i][:clearance],
        :count => coupons[coupons_i][:num]

        }

        cart[cart_i][:count] -= coupons[coupons_i][:num]

      end

      applied_coupons << cart[cart_i]
      coupons_i += 1
      cart_i += 1

    else

      applied_coupons << cart[:cart_i]

    end

  end


end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
