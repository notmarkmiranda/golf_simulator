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

  context '#complete?' do
    it 'returns true' do
      expect(deck.complete?).to be true
    end

    it 'returns false' do
      deck.cards.pop
      expect(deck.complete?).to be false
    end
  end

  context '#shuffle' do
    let(:last_four) { ["JO", "JO", "JO", "JO"] }

    it 'shuffles the cards if the deck is complete' do
      expect(deck.shuffle!).to be true
      expect(deck.shuffle!).to be true
      expect(deck.cards.last(4).map(&:number)).to_not match(last_four)
    end

    it 'does not shuffle the cards if they are incomplete' do
      deck.cards.shift
      expect(deck.shuffle!).to be nil
      expect(deck.cards.last(4).map(&:number)).to match(last_four)
    end
  end
end