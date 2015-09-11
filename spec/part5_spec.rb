require 'part5.rb'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

describe "CartesianProduct" do
  it "should exist" do
    lambda { CartesianProduct.new(1..2,3..4) }.should_not raise_error
  end
  
  it "should yield the cartesian product" do
    c = CartesianProduct.new([:a,:b], [4,5])
    result = []
    c.each { |elt| result.push(elt) }
    
    expect(result).to eq([[:a, 4], [:a, 5], [:b, 4], [:b, 5]])
  end
  
  it "should have no elements if one is empty" do
    c = CartesianProduct.new([:a,:b], [])
    result = []
    c.each { |elt| result.push(elt) }
    
    expect(result).to eq([])
  end
end

