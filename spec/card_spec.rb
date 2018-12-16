require 'pry'
require './lib/card'

describe Card, type: :model do
  let(:card_number) { 'A' }
  let(:card_suit) { 'Spades' }
  let(:card) do 
    Card.new(number: card_number, suit: card_suit)
  end

  context '#new' do
    it 'should be a type of Card' do
      expect(card).to be_a_kind_of(Card)
    end

    it 'should have a number' do
      expect(card.number).to eq(card_number)
    end
    
    it 'should have a suit' do
      expect(card.suit).to eq(card_suit)
    end
  end

  context '#value' do
    subject(:card_value) { card.value }
    context 'for Ace' do
      let(:card_number) { 'A' }

      it 'should return value for Ace as 1' do
        expect(card_value).to eq(1)
      end
    end
    
    context 'should return values for 2 through 10 as face value' do
      let(:all_numbers) { [*2..10] }
      let(:all_suits) { ['Spades', 'Clubs', 'Hearts', 'Diamonds'] }

      it 'returns face value for cards 2 through 10' do
        all_numbers.each do |number|
          all_suits.each do |suit|
            card = Card.new(number: number.to_s, suit: suit)
            
            expect(card.value).to eq(number)
          end
        end
      end
    end
    
    context 'for Queen and Jack' do
      context 'for Queen' do
        let(:card_number) { 'Q' }
  
        it 'should return values for Queen and Jack as 10' do
          expect(card_value).to eq(10)
        end
      end

      context 'for Jack' do
        let(:card_number) { 'J' }
        
        it 'should return value for Jack as 10' do
          expect(card_value).to eq(10)
        end
      end
    end
    
    context 'for King' do
      let(:card_number) { 'K' }

      it 'should return value for King as 0' do
        expect(card_value).to eq(0)
      end
    end

    context 'for Joker' do
      let(:card_number) { 'JO' }
      let(:card_suit) { nil }

      it 'should return value for Joker as -3' do
        expect(card_value).to eq(-3)
      end
    end
  end
end