require_relative 'spec_helper'

describe Robot do

  let(:robot) {Robot.new}
  let(:enemy) {Robot.new}
  let(:laser) {Laser.new}
  let(:plama_cannon) {PlasmaCannon.new}

  describe "#shield_points" do
    it "should have 50 shield points when a new robot is created" do
      expect(robot.shield_points).to eq(50)
    end
  end

  describe "#damage" do
    it "should reduce shield points to 25 after being attacked by the laser" do
      robot.equipped_weapon = laser
      robot.attack(enemy)
      expect(enemy.shield_points).to eq(25)
    end

    it "should return 95 health points and 0 shield points after being hit with a plasma cannon at 55 dmg" do
      robot.equipped_weapon = plama_cannon
      robot.attack(enemy)
      expect(enemy.shield_points).to eq(0)
      expect(enemy.health).to eq(95)
    end
  end

  
end