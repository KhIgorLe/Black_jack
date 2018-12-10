class Card
  RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze
  SUITS = %w(♥ ♦ ♣ ♠).freeze

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    validate!
  end

  def picture?
    ["J", "Q", "K"].include?(@rank)
  end

  def ace?
    @rank == "A"
  end

  def full_name
    "#{rank}#{suit}"
  end

  private

  def validate!
    raise "Rank must be one of: #{RANKS.join(", ")}" unless RANKS.include?(@rank)
    raise "Suit must be one of: #{SUITS.join(", ")}" unless SUITS.include?(@suit)
  end
end
