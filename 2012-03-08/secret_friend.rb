class SecretFriend 
  attr_accessor :names
  attr_accessor :drawn
  

  def valid?
    validate_presence_of_name? && has_enough_names?
  end
  
  def draw
    return false unless valid?

    @drawn = @names.shuffle
  end

protected
  def validate_presence_of_name?
    !@names.nil?
  end
  
  def has_enough_names?
    @names.size >= 3
  end
  
  
end