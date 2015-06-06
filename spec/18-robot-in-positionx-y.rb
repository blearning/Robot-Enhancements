require_relative 'spec_helper'

describe Robot do

  describe ".robot_list" do

    it "instantiates two need robots and returns a number for the total robots of 2" do
      @robot = Robot.new
      @robot2 = Robot.new
      expect(Robot.all_robots.length).to eq(2)
    end

  end
  
end