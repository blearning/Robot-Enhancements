require_relative 'robot'
require_relative 'item'
require_relative 'weapon'
require_relative 'box_of_bolts'
require_relative 'laser'
require_relative 'plasma_cannon'

require_relative 'exceptions'
require 'colorize'


robot = Robot.new
robot2 = Robot.new
laser = Laser.new

#tested: throws eception error of "YouAreDeadError"
# robot.wound(100)
# robot.heal(10)

#tested: throws eception error of "InvalidTargetError"
# robot.attack(robot2) #returns nil
# robot.attack(laser) #returns error