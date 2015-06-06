require_relative 'spec_helper'

describe Robot do

  describe "scan" do

    it "should see deteced 4 robots around him" do
      @robot1 = Robot.new
      @robot2 = Robot.new
      @robot2.move_down  
      @robot3 = Robot.new
      @robot3.move_up   
      @robot4 = Robot.new
      @robot4.move_right  
      @robot5 = Robot.new
      @robot5.move_right
      expect(@robot1.scan.length).to eq(4)
    end

  end
  
end