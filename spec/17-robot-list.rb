require_relative 'spec_helper'

describe Robot do

  describe ".all_robots" do

    it "returns empty array which means that this container is ready to collect robots!" do
      expect(Robot.all_robots).to eq([])
    end

    it "instantiates two need robots and returns a number for the total robots of 2" do
      @robot = Robot.new
      @robot2 = Robot.new
      expect(Robot.all_robots.length).to eq(2)
    end


  end
  
end