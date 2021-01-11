class Oystercard
    MAXIMUM_BALANCE = 90
  def initialize(max = MAXIMUM_BALANCE)
    @max = max
    @balance = 0
  end

  def top_up(amount)
    fail 'maximum balance reached ' + @max.to_s if amount + balance > @max
    @balance = @balance + amount
  
  end
def deduct(amount)
end 
  attr_reader :balance, :max
end
