require 'part1.rb'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

describe "#palindrome?" do
  it "should be defined" do
    lambda { palindrome?("Testing") }.should_not raise_error
  end
  it "should identify palindromes" do
    expect(palindrome? "Madam, I'm Adam").to eq true
    expect(palindrome? "racecar").to eq true
    expect(palindrome? "").to eq true
    expect(palindrome? "a").to eq true
    expect(palindrome? "1221").to eq true
    expect(palindrome? 1221).to eq true
    expect(palindrome? [1,2,3,2,1]).to eq true
    expect(palindrome? "A man, a plan, a canal -- Panama").to eq true
  end
  it "should identify words that aren't palindromes" do
    expect(palindrome? "ab").to eq false
    expect(palindrome? "hello").to eq false
    expect(palindrome? "12345").to eq false
    expect(palindrome? 12345).to eq false
    expect(palindrome? [1,2,3,4,5]).to eq false
    expect(palindrome? "Abracadabra").to eq false
  end
  it "should return true for nil since nil.to_s is ''" do
    expect(palindrome? nil).to eq true
  end
end

describe "#count_words" do
  it "should be defined" do
    lambda { count_words("Testing") }.should_not raise_error
  end

  it "should return a Hash" do
    count_words("Testing").class.should == Hash
  end
  
  it "should return an empty hash for an empty string" do
    expect(count_words('')).to eq({})
  end
  
  it "should return a map of words to counts" do
    expect(count_words("Hi there Tom")).to eq({'hi'=>1, 'there'=>1, 'tom'=>1})
    expect(count_words("hello there bye hello?")).to eq({'hello'=>2, 'there'=>1, 'bye'=>1})
    expect(count_words("why? My name isn't voldemort! Any what of my name?")).to \
      eq({'why'=>1, 'my'=>2, 'name'=>2, "isn't"=>1, 'voldemort'=>1, 'any'=>1, 'what'=>1, 'of'=>1})
    expect(count_words("A man, a plan, a canal -- Panama")).to eq({'a' => 3, 'man' => 1, 'plan' => 1, 'canal' => 1, 'panama' => 1})
    expect(count_words("Doo bee doo bee doo")).to eq({'doo' => 3, 'bee' => 2})
  end
end
