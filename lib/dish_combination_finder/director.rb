module DishCombinationFinder
  class Director
    def self.combinations_from_txt(file_path)
      price_and_menu_data = Parser.new.parse_txt(file_path)
    end
  end
end
