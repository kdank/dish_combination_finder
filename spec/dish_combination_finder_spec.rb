require 'spec_helper'

describe DishCombinationFinder do
  it 'has a version number' do
    expect(DishCombinationFinder::VERSION).not_to be nil
  end

  describe 'feature spec' do
    describe 'when txt file is properly formatted' do
      describe 'and a solution exists' do
        it 'returns a string describing the combination of dishes' do
          results = DishCombinationFinder::Director.combinations_from_txt('spec/fixtures/menu.txt')
          expect(results).to eq("You can get exactly get exactly 15.05 worth of"\
          " dishes by ordering the following: mixed fruit, mixed fruit,"\
          " mixed fruit, mixed fruit, mixed fruit, mixed fruit, mixed fruit")
        end
      end

      describe 'but a solution does not exist' do
        it 'returns a string saying there are no combinations' do
          results = DishCombinationFinder::Director.combinations_from_txt('spec/fixtures/menu_with_no_solution.txt')
          expect(results).to eq("Sorry, no combinations are possible with that price and menu")
        end
      end
    end
  end

  describe 'when txt file is not properly formatted' do
    it 'returns a combination of dishes' do
      expect{
        DishCombinationFinder::Director.combinations_from_txt('spec/fixtures/invalid_menu.txt')
      }.to raise_error(DishCombinationFinder::FileParseError)
    end
  end

  describe 'when txt file does not exist' do
    it 'returns a combination of dishes' do
      expect{
        DishCombinationFinder::Director.combinations_from_txt('spec/fixtures/does_not_exist.txt')
      }.to raise_error(DishCombinationFinder::FileParseError)
    end
  end
end
