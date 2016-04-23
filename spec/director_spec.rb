require 'spec_helper'

describe DishCombinationFinder::Director do
  describe '.combinations_from_csv' do
    it 'doesnt blow up' do
      expect(described_class).to respond_to(:combinations_from_csv)
    end
  end
end
