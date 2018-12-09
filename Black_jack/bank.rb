class Bank

  START_AMOUNT = 100

  BET = 10

  attr_reader :money

  def initialize
    @money = 0
  end

  def set_start_amount
    @money += START_AMOUNT
  end

  def add_money(player_money, dealer_money)
    @money += player_money + dealer_money
  end

  def get_money(money)
    @money += money
  end

  def bet
    @money -= BET
    BET
  end
end
