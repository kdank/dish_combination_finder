module DishCombinationFinder
  class MenuPriceCalculator
    def initialize(price_and_menu_data)
      @price = price_and_menu_data.total_price
      @menu_items = price_and_menu_data.menu_items
    end

    def first_combination
      return 'Please Enter a positive price' if @price < 0
      return 'Order Nothing.  You now have exactly zero $0.00 worth of appetizers' if @price == 0
      stringified_results
    end

    private

    def stringified_results
      combinations = combinations_for(@menu_items, @price)
      if combinations.any?
        "You can get exactly get exactly #{@price.to_s.insert(-3, '.')} worth of dishes "\
          "by ordering the following: #{combinations.first.join(', ')}"
      else
        'Sorry, no combinations are possible with that price and menu'
      end
    end

    # Create and transverse tree of possible orders recursively to find combinations
    # Note:
    # Iterating through possible combinations of sizes 1 thru max_number_of_recipes_in_order
    # might be faster as Array#repeated_combinations is implemented in C but i believe this
    # is the better algorithm
    def combinations_for(menu_items, cents_remaining, tree_branch_index=0)
      return [] if cents_remaining <= 0
      [].tap do |orders|
        menu_items.each_with_index do |menu_item, index|
          next if index < tree_branch_index
          next orders << [menu_item.name] if menu_item.price == cents_remaining
          child_orders = combinations_for(menu_items, (cents_remaining - menu_item.price), index)
          child_orders.each do |child_order|
            new_child_order = child_order << menu_item.name
            orders << new_child_order
          end
        end
      end
    end
  end
end
