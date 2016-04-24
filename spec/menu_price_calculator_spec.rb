require 'spec_helper'

describe DishCombinationFinder::MenuPriceCalculator do
  describe '#first_combination' do
    let(:price_and_menu_data) { double(:price_and_menu_data,
                                total_price: total_price,
                                menu_items: menu_items) }
    let(:calculator) { calculator = described_class.new(price_and_menu_data) }

    context 'when price is below 0' do
      let(:total_price) { -100 }
      let(:menu_items) { [] }

      it 'returns string requesting positive price' do
        expect(calculator.first_combination).to eq('Please Enter a positive price')
      end
    end

    context 'when price is zero' do
      let(:total_price) { 0 }
      let(:menu_items) { [] }

      it 'returns a string describing how to get exactly zero dollars worth of appetizers' do
        expect(calculator.first_combination).to eq('Order Nothing.  You now have exactly zero $0.00 worth of appetizers')
      end
    end

    context 'when there is no possible combination' do
      let(:total_price) { 305 }
      let(:menu_items) { [menu_item_1, menu_item_2] }
      let(:menu_item_1) { double(:menu_item_1, name: 'bottled water', price: 100) }
      let(:menu_item_2) { double(:menu_item_2, name: 'pellegrino', price: 200) }

      it 'returns a string letting you know that no combinations are possible' do
        expect(calculator.first_combination).to eq('Sorry, no combinations are possible with that price and menu')
      end
    end

    context 'when one or more combos exist' do
      let(:total_price) { 305 }
      let(:menu_items) { [menu_item_1, menu_item_2] }
      let(:menu_item_1) { double(:menu_item_1, name: 'taco', price: 105) }
      let(:menu_item_2) { double(:menu_item_2, name: 'burrito', price: 200) }
      let(:menu_item_3) { double(:menu_item_3, name: 'quesedilla', price: 305) }

      it 'returns a string describing the combintion' do
        expect(calculator.first_combination).to eq('You can get exactly get exactly 3.05'\
        ' worth of dishes by ordering the following: burrito, taco')
      end
    end

    context 'one more slightly more complicated example where one or more combos exist' do
      let(:total_price) { 1505 }
      let(:menu_items) { [menu_item_1, menu_item_2, menu_item_3,
                          menu_item_4, menu_item_5, menu_item_6] }
      let(:menu_item_1) { double(:menu_item_1, name: 'mixed fruit', price: 215) }
      let(:menu_item_2) { double(:menu_item_2, name: 'french fries', price: 275) }
      let(:menu_item_3) { double(:menu_item_3, name: 'side salad', price: 335) }
      let(:menu_item_4) { double(:menu_item_4, name: 'hot wings', price: 355) }
      let(:menu_item_5) { double(:menu_item_5, name: 'mozzarella sticks', price: 420) }
      let(:menu_item_6) { double(:menu_item_6, name: 'sampler plate', price: 580) }

      it 'returns a string describing the combintion' do
        expect(calculator.first_combination).to eq('You can get exactly get exactly 15.05'\
        ' worth of dishes by ordering the following: mixed fruit, mixed fruit, mixed fruit,'\
        ' mixed fruit, mixed fruit, mixed fruit, mixed fruit')
      end
    end
  end
end
