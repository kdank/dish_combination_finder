require 'spec_helper'

describe DishCombinationFinder::Director do
  describe '.combinations_from_txt' do
    let(:file_path) { 'path/to/file' }
    let(:parser) { double(:parser) }
    let(:calculator) { double(:calculator) }
    let(:price_and_menu_data) { double(:price_and_menu_data) }

    before do
      allow(DishCombinationFinder::Parser).to receive(:new) {parser}
      allow(parser).to receive(:parse_txt).with(file_path) { price_and_menu_data }
      allow(DishCombinationFinder::MenuPriceCalculator).to receive(:new).with(price_and_menu_data) { calculator }
      allow(calculator).to receive(:first_combination) { calculator }
    end

    it 'calls the Parser to parse the txt' do
      described_class.combinations_from_txt(file_path)
      expect(parser).to have_received(:parse_txt)
    end

    it 'calls the MenuPriceCalculator and returns the result' do
      described_class.combinations_from_txt(file_path)
      expect(calculator).to have_received(:first_combination)
    end
  end
end
