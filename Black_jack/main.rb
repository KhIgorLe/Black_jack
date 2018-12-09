require_relative 'player'
require_relative 'round'
require_relative 'rank_suits'

class Main

  def initialize
    @interface = create_interface
    @player = set_player
    @dealer = set_dealer
    @round = set_round
  end

  def create_interface
    Interface.new
  end

  def run
    round_action
  end

  private

  def round_action
    command = ''
    while command != 0 && @player.bank.money >= @round.bank.bet && @dealer.bank.money >= @round.bank.bet
      @interface.main_menu
      command = @interface.command
      case command
      when 1 then @round.start
      when 0 then break
      else
        @interface.wrong_command
      end
    end
    return @interface.out_of_money if @player.bank.money < @round.bank.bet
    return @interface.congratulation if @dealer.bank.money < @round.bank.bet
    @interface.bye
  end

  def set_player
    Player.new(@interface.set_name)
  end

  def set_dealer
    Player.new
  end

  def set_round
    Round.new(@player, @dealer)
  end
end

Main.new.run
