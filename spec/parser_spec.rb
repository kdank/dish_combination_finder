require 'spec_helper'

describe DishCombinationFinder::Parser do
  describe '#parse' do
    let(:parser) { described_class.new }
    let(:file_path) { 'spec/fixtures/menu.txt' }

    context 'when first line is a price and following lines are names/prices' do
      it 'returns a Struct with proper total price' do
        parsed_data = parser.parse_txt(file_path)
        expect(parsed_data.total_price).to eq(1505)
      end

      it 'returns a Struct with proper menu_items' do
        parsed_data = parser.parse_txt(file_path)
        expect(parsed_data.menu_items.size).to eq(6)
        expect(parsed_data.menu_items[0].name).to eq('mixed fruit')
        expect(parsed_data.menu_items[0].price).to eq 215
        expect(parsed_data.menu_items[5].name).to eq('sampler plate')
        expect(parsed_data.menu_items[5].price).to eq 580
      end
    end

    context 'when txt file is not present or invalid' do
      it 'raises an error' do
        expect{parser.parse_txt(nil)}.to raise_error(DishCombinationFinder::FileParseError)
      end
    end
  end
end
