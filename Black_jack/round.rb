require_relative 'deck'
require_relative 'winner'
require_relative 'interface'

class Round
  attr_reader :bank, :interface

  def initialize(player, dealer)
    @deck = set_deck
    @player = player
    @dealer = dealer
    @bank = create_bank
    @interface = create_interface
  end

  def start
    @deck = set_deck if @deck.cards.size < 4
    set_cards
    rate
    @interface.score_board(@player)
    @interface.separator
    @interface.show_star(@dealer)
    action
    who_win
    @interface.total_information(@player, @dealer)
    puts @deck.cards.size
    reset_cards
  end

  private

  def action
    loop do
      break if need_open_cards?
      @interface.round_menu
      command = @interface.command
      case command
      when 1 then dealer_action
      when 2 then player_action
      when 3 then break
      else
        @interface.wrong_command
      end
    end
  end

  def who_win
    result = winner.determine_winner
    send(result)
  end

  def black_jack
    @interface.black_jack
    player_win
  end

  def dealer_win
    @dealer.bank.get_money(20)
    @interface.dealer_win
  end

  def player_win
    @player.bank.get_money(20)
    @interface.player_win
  end

  def draw
    @player.bank.get_money(10)
    @dealer.bank.get_money(10)
    @interface.draw
  end

  def rate
    @bank.add_money(@player.bank.bet, @dealer.bank.bet)
  end

  def need_open_cards?
    cards_count? || @player.hand.exceeded_points? || @dealer.hand.exceeded_points? || black_jack?
  end

  def black_jack?
    @player.hand.black_jack? || @dealer.hand.black_jack?
  end

  def cards_count?
    (@dealer.hand.score > 16 || @dealer.hand.cards.size > 2) && @player.hand.cards.size > 2
  end

  def dealer_action
    if @dealer.hand.score > 16 || @dealer.hand.cards.size > 2
      @interface.missed_move
      return
    end

    new_deck?
    @dealer.set_cards(cards(1))
    @interface.show_star(@dealer)
    @interface.total_information(@player, @dealer) if black_jack?
  end

  def player_action
    return if @player.hand.cards.size != 2

    new_deck?
    @player.set_cards(cards(1))
    dealer_action if @player.hand.score < 21
  end

  def winner
    Winner.new(@player, @dealer)
  end

  def cards(count)
    @deck.get_cards(count)
  end

  def set_cards
    @player.set_cards(cards(2))
    @dealer.set_cards(cards(2))
  end

  def reset_cards
    @player.reset_cards
    @dealer.reset_cards
  end

  def set_deck
    Deck.new
  end

  def new_deck?
    @deck = set_deck if @deck.cards.empty?
  end

  def create_bank
    Bank.new
  end

  def create_interface
    Interface.new
  end
end
