require_relative 'card'
require_relative 'rank_suits'

class Deck

  include RankSuits

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
    RANK.each do |rank|
      SUITS.each do |suit|
        cards << Card.new(rank, suit)
      end
    end
    cards.shuffle!
  end
  rescue RuntimeError => e
    puts e.message
    retry
end
