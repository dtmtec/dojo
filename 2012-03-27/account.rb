class Account
  attr_accessor :balance, :bank

  TRANSFER_FEE = 8

  def transfer(amount, target_account)
    return false unless has_enough_balance?(amount)

    if self.bank != target_account.bank
      self.balance -= amount + TRANSFER_FEE
    else
      self.balance -= amount
    end

    target_account.balance += amount

    true
  end

  def has_enough_balance?(amount, fee = 0)
    amount + fee <= self.balance
  end

end