class ATM
  def self.withdraw(value)
    raise 'Impossible to withdraw. It is not multiple of 10.' unless value % 10 == 0
    
    # com recursão retornando array.
    if value >= 100
      [100] + withdraw(value - 100)
    elsif value >= 50
      [50] + withdraw(value - 50)
    elsif value >= 20
      [20] + withdraw(value - 20)
    elsif value >= 10
      [10] + withdraw(value - 10)
    else
      []
    end

    # sem recursão retornando array.
    notes = []    
    [100, 50, 20, 10].each do |note|
      while (value >= note) do
        notes << note
        value -= note
      end
    end
    return notes

    # com div e mod, retornando hash
    notes = {}
    [100, 50, 20, 10].each do |note|
      if (value >= note) do
        notes[note.to_s] = value / note
        value = value % note
      end
    end
    notes

  end

end