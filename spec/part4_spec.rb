require 'part4.rb'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

describe "Class" do
  it "should have an attr_accessor_with_history method" do
    lambda { Class.new.attr_accessor_with_history :x }.should_not raise_error
  end
  
  it "should return an array before assignment on _history" do
    class Foo
      attr_accessor_with_history :my_variable
    end
    
    expect(Foo.new.my_variable_history).to eq([])
  end
  
  it "should define some_var and some_var_history" do
    class Foo
      attr_accessor_with_history :some_var
    end
    
    var = Foo.new

    expect(var.some_var_history).to eq([])
    expect(var.some_var).to eq(nil)
    var.some_var = 12
    var.some_var = 'Hi'
    var.some_var = [1,2,3]
    expect(var.some_var).to eq([1,2,3])
    expect(var.some_var_history).to eq([nil, 12, 'Hi', [1,2,3]])
  end
  
  it "should handle multiple history tracked variables" do
    class Foo
      attr_accessor_with_history :some_var
      attr_accessor_with_history :something
    end
    
    var = Foo.new

    expect(var.some_var_history).to eq([])
    expect(var.some_var).to eq(nil)
    var.some_var = 12
    var.some_var = 'Hi'
    var.some_var = [1,2,3]
    expect(var.some_var).to eq([1,2,3])
    expect(var.some_var_history).to eq([nil, 12, 'Hi', [1,2,3]])
    
    expect(var.something_history).to eq([])
    expect(var.something).to eq(nil)
    var.something = ''
    var.something = '12345'
    var.something = :hi
    expect(var.something).to eq(:hi)
    expect(var.something_history).to eq([nil, '', '12345', :hi])
  end
end

