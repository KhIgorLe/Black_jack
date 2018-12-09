class Interface

  MAIN_MENU = <<-MENU.freeze
    Select a menu item:
    Enter 1 - Deal cards
    Enter 0 - Exit
  MENU

  ROUND_MENU = <<-MENU.freeze
    Select a menu item:
    Enter 1 - Pass
    Enter 2 - Add a card
    Enter 3 - Show cards
  MENU

  def score_board(player)
    puts "#{player.name} cards: #{player.hand.cards.map(&:full_name).join(" ")}"
    puts "#{player.name} score: #{player.hand.score}"
    puts "#{player.name} money: #{player.bank.money}"
  end

  def separator
    puts "#" * 25
  end

  def show_star(dealer)
    stars = "*" * dealer.hand.cards.size
    puts "Dealer cards: #{stars}"
  end

  def total_information(player, dealer)
    puts ""
    puts "Total information:"
    score_board(player)
    separator
    score_board(dealer)
  end

  def wrong_command
    puts "Command is entered incorrectly."
  end

  def black_jack
    puts "Black Jack"
  end

  def dealer_win
    puts "Game result: Dealer win"
  end

  def player_win
    puts "Game result: Player win"
  end

  def draw
    puts "Game result: Draw"
  end

  def missed_move
    puts "Dealer missed the move"
  end

  def round_menu
    puts ROUND_MENU
  end

  def main_menu
    puts MAIN_MENU
  end

  def command
    command = gets.to_i
  end

  def out_of_money
    puts "You lose, run out of money"
  end

  def congratulation
    puts "You win, come again"
  end

  def bye
    puts "See you later"
  end

  def set_name
    puts "Enter your name"
    name = gets.chomp
  end
end
