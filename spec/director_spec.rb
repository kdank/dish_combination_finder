require 'spec_helper'

describe DishCombinationFinder::Director do
  describe '.combinations_from_txt' do
    let(:file_path) { 'path/to/file' }
    let(:parser) { double(:parser) }
    let(:price_and_menu_data) { double(:price_and_menu_data) }

    it 'calls the Parser to parse the txt' do
      allow(DishCombinationFinder::Parser).to receive(:new) {parser}
      expect(parser).to receive(:parse_txt).with(file_path) { price_and_menu_data }
      described_class.combinations_from_txt(file_path)
    end
  end
end
