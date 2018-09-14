def pet_shop_name(pet_shop)
  return @pet_shop[:name]
end

def total_cash(pet_shop_cash)
  return @pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop,money)
  @pet_shop[:admin][:total_cash] += money
end

def pets_sold(pet_shop)
  return @pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, number)
  @pet_shop[:admin][:pets_sold] += number
end

def stock_count(pet_shop)
  return @pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed)
  result = []
  for animal in @pet_shop[:pets]
    if animal[:breed] == breed
      result << animal
    end
  end
  return result
end

def find_pet_by_name(pet_shop, name)
  for animal in @pet_shop[:pets]
    if animal[:name] == name
      return animal
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
  count = 0
  for animal in @pet_shop[:pets]
    count += 1
    if animal[:name] == name
      counter = count
    end
  end
  if counter > 0
    counter -= 1
    @pet_shop[:pets].delete_at(counter)
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  @pet_shop[:pets] << new_pet
end

def customer_cash(customer)
  total_cash = 0
  total_cash += customer[:cash]
  return total_cash
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customers)
  return customers[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

#OPTIONAL QUESTIONS

def customer_can_afford_pet(customer, new_pet)
  customer_funds = customer[:cash]
  pet_cost = @new_pet[:price]
  if customer_funds > pet_cost
    return true
  end
  return false
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if customer_can_afford_pet(customer, pet) == true
    pet_cost = pet[:price]
    name = pet[:name]
    customer[:cash] -= pet_cost
    add_or_remove_cash(pet_shop,pet_cost)
    add_pet_to_customer(customer, pet)
    remove_pet_by_name(pet_shop, name)
    increase_pets_sold(pet_shop, 1)
  end
end
