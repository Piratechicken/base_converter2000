require 'rails_helper'

RSpec.describe NumberConversion, type: :model do

  it "should convert numbers to binary" do 
    expect(NumberConversion.new(number: 2, base: 2).result).to eq('10')
    expect(NumberConversion.new(number: 8, base: 2).result).to eq('1000')
    expect(NumberConversion.new(number: 9, base: 2).result).to eq('1001')
    expect(NumberConversion.new(number: 32982734, base: 2).result).to eq('1111101110100011011001110')
    expect(NumberConversion.new(number: 732, base: 2).result).to eq('1011011100')
    
    (0..1000).each do |n|
      actual = n.to_s(2)
      expect(NumberConversion.new(number: n, base: 2).result).to eq(actual)
    end
  end

  it "should convert numbers to hexadecimal" do 
    expect(NumberConversion.new(number: 0, base: 16).result).to eq('0')
    expect(NumberConversion.new(number: 2, base: 16).result).to eq('2')
    expect(NumberConversion.new(number: 11, base: 16).result).to eq('b')
    expect(NumberConversion.new(number: 16, base: 16).result).to eq('10')
    expect(NumberConversion.new(number: 75, base: 16).result).to eq('4b')
    expect(NumberConversion.new(number: 32982734, base: 16).result).to eq('1f746ce')
    expect(NumberConversion.new(number: 732, base: 16).result).to eq('2dc')
  
    (0..1000).each do |n|
      actual = n.to_s(16)
      expect(NumberConversion.new(number: n, base: 16).result).to eq(actual)
    end
  end

  it "should convert numbers to base 3" do 
    expect(NumberConversion.new(number: 2, base: 3).result).to eq('2')
    expect(NumberConversion.new(number: 3, base: 3).result).to eq('10')
    expect(NumberConversion.new(number: 8, base: 3).result).to eq('22')
    expect(NumberConversion.new(number: 0, base: 3).result).to eq('0')
    expect(NumberConversion.new(number: 32982734, base: 3).result).to eq('2022001200210202')
    expect(NumberConversion.new(number: 732, base: 3).result).to eq('1000010')

    (0..1000).each do |n|
      actual = n.to_s(3)
      expect(NumberConversion.new(number: n, base: 3).result).to eq(actual)
    end
  end

  it "should allow valid values" do 
    expect(NumberConversion.new(number: 3, base: 2).valid?).to eq(true)
    expect(NumberConversion.new(number: 2874, base: 7)).to be_valid
    expect(NumberConversion.new(number: 0, base: 16)).to be_valid
    expect(NumberConversion.new(number: 23, base: 16)).to be_valid
  end

  it "should disallow invalid numbers" do 
    expect(NumberConversion.new(number: -1, base: 2).invalid?).to eq(true)
    expect(NumberConversion.new(number: -3, base: 2).invalid?).to eq(true)
    expect(NumberConversion.new(number: -286, base: 5).valid?).to eq(false)
    expect(NumberConversion.new(number: -2874, base: 16)).to be_invalid
    expect(NumberConversion.new(number: 'asj', base: 16)).to be_invalid
  end

  it "should disallow invalid bases" do 
    expect(NumberConversion.new(number: 10, base: 0)).to be_invalid
    expect(NumberConversion.new(number: 10, base: 1)).to be_invalid
    expect(NumberConversion.new(number: 10, base: 'abd')).to be_invalid
    expect(NumberConversion.new(number: 10, base: -5)).to be_invalid
  end
    
  it "should disallow missing required attributes" do
    expect(NumberConversion.new).to be_invalid
    expect(NumberConversion.new(number: '', base: '')).to be_invalid
  end

end
