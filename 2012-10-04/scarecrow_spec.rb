require 'rspec'
require './scarecrow'

describe 'scarecrow' do
  it 'should put 0 scarecrows in empty field' do
    scarecrow = Scarecrow.new()
    scarecrow.place('').should eq(0)
  end

  it 'should put 1 scarecrow in 1 section field' do
    scarecrow = Scarecrow.new()
    scarecrow.place('.').should eq(1)
  end

  it 'should put 0 scarecrows in 1 non-usable section field' do
    scarecrow = Scarecrow.new()
    scarecrow.place('#').should eq(0)
  end

  it 'should put 1 scarecrows in 2 section field' do
    scarecrow = Scarecrow.new()
    scarecrow.place('..').should eq(1)
  end

  it 'should put 0 scarecrows in 2 non-usable section field' do
    scarecrow = Scarecrow.new()
    scarecrow.place('##').should eq(0)
  end

  it 'should put 0 scarecrows in 30 non-usable section field' do
    scarecrow = Scarecrow.new()
    scarecrow.place('#'*30).should eq(0)
  end

  it 'should put 1 scarecrows with 1 usable and 1 non-usable section field' do
    scarecrow = Scarecrow.new()
    scarecrow.place('.#').should eq(1)
  end

  it 'should put 2 scarecrows with 4 usable section field' do
    scarecrow = Scarecrow.new()
    scarecrow.place('....').should eq(2)
  end

  it 'should put 2 scarecrows when input is .##.' do
    scarecrow = Scarecrow.new()
    scarecrow.place('.##.').should eq(2)
  end

  it 'should put 2 scarecrows when input is .###.' do
    scarecrow = Scarecrow.new()
    scarecrow.place('.###.').should eq(2)
  end

  it 'should put 2 scarecrows when input is .#.#.' do
    scarecrow = Scarecrow.new()
    scarecrow.place('.#.#.').should eq(2)
  end

  it 'should put 1 scarecrows when input is #.#.#' do
    scarecrow = Scarecrow.new()
    scarecrow.place('#.#.#').should eq(1)
  end

  it 'should put 3 scarecrows when input is ...##....##' do
    scarecrow = Scarecrow.new()
    scarecrow.place('...##....##').should eq(3)
  end

end