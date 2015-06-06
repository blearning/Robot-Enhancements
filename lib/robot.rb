class Robot
    MAX_CAPACITY = 250
    MAX_HEALTH = 100
    MIN_HEALTH = 0

    @@all_robots = []

  attr_reader :position, :items, :health, :shield_points
  attr_accessor :equipped_weapon

  def initialize
    @position = [0,0]
    @items = []
    @health = MAX_HEALTH
    @equipped_weapon = nil
    @shield_points = 50
    @@all_robots << self
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

    item.feed(self) if item.is_a?(BoxOfBolts) && health <= 80
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
    @shield_points -= damage if (shield_points > 0)
    if shield_points < 0
      @health -= shield_points.abs
      @shield_points = 0
    else
    @health -= damage
    end
    @health = 0 if health <= MIN_HEALTH
    #@health = (@health, MIN_HEALTH).max
  end

  def shield_recharge(charge)
    @shield_points += charge
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
    if enemy_in_range?(target)
      equipped_weapon == nil ? target.wound(5) : equipped_weapon.hit(target)
      @equipped_weapon = nil if equipped_weapon.is_a?(Grenade)
    end
  end

  def attack!(target)
    begin 
      raise UnattackableEnemy, "INVALID - NOT ATTACKABLE: you can only attack robots" unless target.is_a? Robot
    end
  end

  def enemy_in_range?(target)
    x_position_grenade_range = (position[0]-2..position[0]+2)
    y_position_grenade_range = (position[1]-2..position[1]+2)

    x_position_range = (position[0]-1..position[0]+1)
    y_position_range = (position[1]-1..position[1]+1)

    if equipped_weapon.is_a?(Grenade) && x_position_grenade_range.include?(target.position[0]) && y_position_grenade_range.include?(target.position[1])
      return true
    elsif (x_position_range.include?(target.position[0]) && y_position_range.include?(target.position[1]))
      return true
    end
    return false
  end

  def scan

    x_position_range = (position[0]-1..position[0]+1)
    y_position_range = (position[1]-1..position[1]+1)

    other_robots = Robot.all_robots.select { |robot| robot != self }

    other_robots.each do |robot|
      if (x_position_range.include?(robot.position[0]) && y_position_range.include?(robot.position[1]))
      end
    end


  end



  class << self 

    def all_robots
      @@all_robots
    end

    def robot_list
      i = 0
      @@all_robots.each do |robot|
        i += 1
        puts "Robot ##{i}) #{robot.position}"
      end
    end

  end

end