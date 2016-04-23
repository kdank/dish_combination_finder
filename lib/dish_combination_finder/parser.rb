module DishCombinationFinder
  class FileParseError < StandardError
    def initialize(msg='Please make sure txt file exists and is in the format described in the read me')
      super
    end
  end

  PriceAndMenuResults = Struct.new(:total_price, :menu_items)
  MenuItem = Struct.new(:name, :price)

  class Parser
    def parse_txt(file_path)
      lines = File.readlines(file_path).map(&:strip)
      total_price = convert_money_string_to_float(lines.shift)
      menu_items = lines.map do |line|
        parsed_line = line.split(',')
        name = parsed_line[0]
        price = convert_money_string_to_float(parsed_line[1])
        MenuItem.new(name, price)
      end
      PriceAndMenuResults.new(total_price, menu_items)
    rescue => e
      Raise FileParseError
    end

    private

    def convert_money_string_to_float(string)
      string[1..-1].to_f
    end
  end
end
