require_relative 'player'
require_relative 'round'

class Main
  def initialize
    @interface = create_interface
    @player = set_player
    @dealer = set_dealer
    @round = set_round
  end

  def run
    round_action
  end

  private

  def round_action
    loop do
      @interface.main_menu
      command = @interface.command
      case command
      when 1 then @round.start
      when 0 then break
      else
        @interface.wrong_command
      end
      break if players_not_have_money?(@player) || players_not_have_money?(@dealer)
    end
    return @interface.out_of_money if players_not_have_money?(@player)
    return @interface.congratulation if players_not_have_money?(@dealer)
    @interface.bye
  end

  def players_not_have_money?(player)
    player.bank.money < @round.bank.bet
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

  def create_interface
    Interface.new
  end
end

Main.new.run
