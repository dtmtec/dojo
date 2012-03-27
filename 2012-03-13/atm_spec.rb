# encoding: utf-8
require './atm.rb'

describe ATM do

  describe ".withdraw" do

    it "should give division given the value to withdraw" do
      ATM.withdraw(100).should eq({ "100" => 1 })
      ATM.withdraw(70).should eq({ "50" => 1, "20" => 1 })
      ATM.withdraw(30).should eq({ "20" => 1, "10" => 1 })
    end
    
    it "answer impossible withdraw if not multiple of 10" do
      expect { ATM.withdraw(15) }.to raise_error('Impossible to withdraw. It is not multiple of 10.')
    end

  end

end