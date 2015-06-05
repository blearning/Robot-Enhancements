class Robot

    MAX_CAPACITY = 250
    MAX_HEALTH = 100
    MIN_HEALTH = 0

  attr_reader :position, :items, :health
  attr_accessor :equipped_weapon

  def initialize
    @position = [0,0]
    @items = []
    @health = MAX_HEALTH
    @equipped_weapon = nil
  end

  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

  def pick_up(item)
    # binding.pry
    if item.weight + items_weight <= MAX_CAPACITY
      @items << item
      (item.is_a? Weapon) ? @equipped_weapon = item : @equipped_weapon = nil
      return true
    else
      return false
    end
  end
    # @items << item if item.weight + items_weight < MAX_CAPACITY
    # equipt_weapon?(item)

  def items_weight
    @items.inject(0){|sum, item| sum + item.weight}
  end

  def wound(damage)
    @health -= damage
    @health = 0 if health <= MIN_HEALTH
    #@health = (@health, MIN_HEALTH).max
  end

  def heal(hp)
    heal!
    @health += hp if health < MAX_HEALTH
    @health = 100 if health > MAX_HEALTH
  end

  def heal!
    begin 
      raise RobotAlreadyDeadError, "INVALID - ROBOT ALREADY DEAD ERROR: your health is at 0. You are dead. You cannot revive robot" if health == 0
    end
  end

  def attack(target)
    attack!(target)
    equipped_weapon == nil ? target.wound(5) : equipped_weapon.hit(target)
  end

  def attack!(target)
    begin 
      raise UnattackableEnemy, "INVALID - NOT ATTACKABLE: you can only attack robots" unless target.is_a? Robot
    end
  end

end


