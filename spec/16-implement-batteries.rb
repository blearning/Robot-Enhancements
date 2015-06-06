require_relative 'spec_helper'

describe Batteries do

  let(:batteries) {Batteries.new}
  let(:robot) {Robot.new}

  describe "#batteries" do
    it "is an instance of Batteries" do
      expect(batteries).to be_an_instance_of (Batteries)
    end

    it "can recharge robots shield points" do
      batteries.recharge(robot)
      expect(robot.shield_points).to eq(70)
    end
  end

  
end