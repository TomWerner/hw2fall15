require 'part3.rb'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

describe "dessert" do
  it "should define a constructor" do
    lambda { Dessert.new('a', 1) }.should_not raise_error
  end
  %w(healthy? delicious? name name= calories calories=).each do |method|
    it "should define #{method}" do
      Dessert.new('a',1).should respond_to method
    end
  end  
  
  it "should only be healthy if under 200 calories" do
    expect(Dessert.new('a', -100).healthy?).to eq true
    expect(Dessert.new('a', 0).healthy?).to eq true
    expect(Dessert.new('a', 100).healthy?).to eq true
    expect(Dessert.new('a', 199).healthy?).to eq true
    expect(Dessert.new('a', 200).healthy?).to eq false
    expect(Dessert.new('a', 2000).healthy?).to eq false
  end
  
  it "should always be delicious" do 
    expect(Dessert.new('','').delicious?).to eq true
  end 
end


describe "jellybean" do
  it "should define a constructor" do
    lambda { JellyBean.new('a', 1, 2) }.should_not raise_error
  end
  %w(healthy? delicious? name name= calories calories= flavor flavor=).each do |method|
    it "should define #{method}" do
      JellyBean.new('a',1, 2).should respond_to method 
    end
  end
  
  it "should only be healthy if under 200 calories" do
    expect(JellyBean.new('a', -100, '').healthy?).to eq true
    expect(JellyBean.new('a', 0, '').healthy?).to eq true
    expect(JellyBean.new('a', 100, '').healthy?).to eq true
    expect(JellyBean.new('a', 199, '').healthy?).to eq true
    expect(JellyBean.new('a', 200, '').healthy?).to eq false
    expect(JellyBean.new('a', 2000, '').healthy?).to eq false
  end
  
  it "all non black licorice flavors are delicious" do 
    expect(JellyBean.new('','', 1).delicious?).to eq true
    expect(JellyBean.new('','', 'licorice').delicious?).to eq true
    expect(JellyBean.new('','', '123').delicious?).to eq true
    expect(JellyBean.new('','2', []).delicious?).to eq true
    expect(JellyBean.new('',567, 'black licorice').delicious?).to eq false
    expect(JellyBean.new('',453, 'green').delicious?).to eq true
    expect(JellyBean.new('',12, 'Black Licorice').delicious?).to eq false
  end 
end
