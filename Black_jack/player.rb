require_relative 'bank'
require_relative 'hand'

class Player
  attr_reader :name, :hand, :bank

  def initialize(name = "Dealer")
    @name = name
    @hand = create_hand
    @bank = create_bank
    set_start_amount
  end

  def set_cards(cards)
    @hand.cards.concat(cards)
  end

  def reset_cards
    @hand.cards.clear
  end

  private

  def create_hand
    Hand.new
  end

  def create_bank
    Bank.new
  end

  def set_start_amount
    @bank.set_start_amount
  end
end
