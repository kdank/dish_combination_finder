module DishCombinationFinder
  class Director
    def self.combinations_from_txt(file_path)
      price_and_menu_data = Parser.new.parse_txt(file_path)
      MenuPriceCalculator.new(price_and_menu_data).first_combination
    end
  end
end
