require './lib/deck'

describe Deck, type: :model do
  let(:deck) { Deck.new }

  context '#new' do
    it 'should be a type of Deck' do
      expect(deck).to be_a_kind_of(Deck)
    end
  end

  context '#card_count' do
    subject(:card_count) { deck.card_count }

    it 'should start with 108 cards in the deck' do
      expect(card_count).to eq(108)
    end
  end
end