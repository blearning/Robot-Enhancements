class Batteries < Item
  def initialize
    super("Batteries", 25)
  end

  def recharge(target)
    target.shield_recharge(20)
  end
end