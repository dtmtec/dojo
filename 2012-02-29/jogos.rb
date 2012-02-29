class Bolao
  attr_accessor :apostas, :resultados
  
  def initialize
    @apostas = []
  end
  
  def valido?
    !self.apostas.empty?
  end
end