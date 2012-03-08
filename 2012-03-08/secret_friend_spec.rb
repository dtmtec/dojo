# encoding: utf-8
require './secret_friend.rb'

describe SecretFriend do
  
  it 'should receive names list' do
    subject.names = ["Nelson", "Otavio", "Felipe"]
    subject.names.should eq(["Nelson", "Otavio", "Felipe"])
  end
  
  describe '#valid?' do
    
    it 'false if names list is null' do
      subject.stub(:has_enough_names?).and_return(true)
      subject.should_not be_valid
    end

    it 'false if names list is empty' do
      subject.names = []
      subject.should_not be_valid
    end

    it "list should have at least 3 names" do
      subject.names = ["Nelson", "Otavio"]
      subject.should_not be_valid
    end
    
    it 'true if list has 3 names' do
      subject.names = ['Nelson', 'Otavio', 'Jose']
      subject.should be_valid
    end
  end
  
  describe '#draw' do
    it 'return false if not valid' do
      subject.draw.should be_false
    end
    
    it 'fills drawn' do
      subject.names = ['Nelson', 'Otavio', 'Jose']
      subject.stub(:valid?).and_return(true)
      subject.draw.should be_true
    end

    it 'initial list should not be equal to drawn list' do
      subject.names = [ 'Nelson', 'jose', 'silva' ]
      subject.stub(:valid?).and_return(true)
      subject.draw.first
    end
  end
      
end