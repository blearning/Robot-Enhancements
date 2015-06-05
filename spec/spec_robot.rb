require_relative 'spec_helper'

describe Robot do

  let(:robot) {Robot.new}
  let(:robot_2) {Robot.new}
  let(:pasma_canon) {PlasmaCannon.new}

  describe "#heal!" do

    it "should introduce error when trying to heal a dead robot" do
      robot.should_receive(:health).and_return(0)
      expect{ robot.heal(100) }.to raise_exception(RobotAlreadyDeadError)
    end

    it "should be non error when healing a robot that has one health" do
      robot.wound(99)
      robot.heal(10)
      expect(robot.health).to eq(11)
    end
  end

  describe "#attack!" do

    it "should be introduce error when trying to attack non robot object" do
      expect{ robot.attack(pasma_canon) }.to raise_exception (UnattackableEnemy)
    end

    it "should be able to attack another robot" do
      expect{ robot.attack(robot_2) }.not_to raise_exception
    end

  end
  
end