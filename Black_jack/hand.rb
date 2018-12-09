class Hand

  attr_reader :cards

  def initialize
    @cards = []
  end

  def score
    @cards.inject(0) do |sum, card|
      sum + points(sum, card)
    end
  end

  def exceeded_points?
    score > 21
  end

  def black_jack?
    score == 21
  end

  private

  def points(sum, card)
    return 10 if card.picture?
    return sum < 11 ? 11 : 1 if card.ace?

    card.rank.to_i
  end

end
