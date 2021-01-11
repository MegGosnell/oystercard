class Oystercard
    MAXIMUM_BALANCE = 90
  def initialize(max = MAXIMUM_BALANCE)
    @max = max
    @balance = 0
    @in_use = false
  end

  def top_up(amount)
    fail 'maximum balance reached ' + @max.to_s if amount + balance > @max
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise "Already in use" if in_journey?
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  def in_journey?
    @in_use == true
  end

  attr_reader :balance, :max, :in_use
end
