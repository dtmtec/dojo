require './account.rb'

describe Account do
  describe '#transfer' do
    let(:target_account) { Account.new }

    context 'person has balance' do
      before do
        subject.balance = 1000
        target_account.balance = 1000
      end

      it 'reduces source balance' do
        subject.transfer(200, target_account)
        subject.balance.should eq(800)
      end

      it 'increments target balance' do
        subject.transfer(200, target_account)
        target_account.balance.should eq(1200)
      end

      it "notifies about transfer success" do
        subject.transfer(200, target_account).should be true
      end
    end

    context 'person has not balance' do
      before do
        subject.balance = 1000
        target_account.balance = 1000
      end

      it "notifies about transfer cancellation" do
        subject.transfer(1200, target_account).should be false
      end

      it 'keeps target balance' do
        subject.transfer(1200, target_account)
        target_account.balance.should eq(1000)
      end

      it 'keeps source balance' do
        subject.transfer(1200, target_account)
        subject.balance.should eq(1000)
      end
    end
    
    context 'target is from diferent bank' do
      before do
        subject.balance = 1000
        subject.bank = 'a'

        target_account.balance = 1000
        target_account.bank = 'b'
      end

      it 'charges transfer fee' do
        subject.transfer(200, target_account)
        subject.balance.should eq(792)
      end

    end
  end

  describe "#has_enough_balance?" do
    before { subject.balance = 1000 }

    it "is true if has balance enough to transfer" do
      subject.has_enough_balance?(800).should be true
    end

    it "is false if does not have balance enough to transfer" do
      subject.has_enough_balance?(1200).should be false
    end
    
    context "target is from diferent bank" do
      it "is false if does not have balance enough to transfer with fee" do
        subject.has_enough_balance?(1000, 8).should be false
      end
    end
    
  end
  
  describe '#total_amount' do
    
  end

end