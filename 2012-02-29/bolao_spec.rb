require './jogos.rb'

describe Bolao do
  it 'deve ser valido' do
    bolao = Bolao.new
    bolao.apostas << '0x2,0x5'
    bolao.should be_valido
  end

  it 'usuario faz apostas' do
    bolao = Bolao.new

    aposta = { :apostador => "0x2,1x3,4x2" }
    bolao.apostas << aposta
    bolao.apostas.first[:apostador].should eq("0x2,1x3,4x2")
  end

  it "segundo usuario faz aposta" do
    bolao = Bolao.new

    aposta1 = { :apostador => "0x2,1x3,4x2" }
    aposta2 = { :apostador2 => "1x2,1x2,4x2" }
    bolao.apostas << aposta1
    bolao.apostas << aposta2
    bolao.apostas.last[:apostador2].should eq("1x2,1x2,4x2")
  end

  it "recebe placar" do
  end

end