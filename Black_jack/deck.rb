require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = set_cards
  end

  def get_cards(count)
    @cards.pop(count)
  end

  private

  def set_cards
    cards = []
    Card.ranks.each do |rank|
      Card.suits.each do |suit|
        cards << Card.new(rank, suit)
      end
    end
    cards.shuffle!
  end
end
