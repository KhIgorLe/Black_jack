require_relative 'rank_suits'

class Card

  include RankSuits

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
    raise "Rank must be one of: #{RANK.join(", ")}" unless RANK.include?(@rank)
    raise "Suit must be one of: #{SUITS.join(", ")}" unless SUITS.include?(@suit)
  end
end
