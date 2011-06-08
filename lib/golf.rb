class Golf
  
  def self.hole1(a)
    a.inject(1) { |collection, item| collection = item * collection }
  end
  
  def self.hole2(a)
    (a[0]..a[1]).to_a.select {|x| x.to_s == x.to_s.reverse }
  end
  
  
  # describe ".hole3" do
  #     it "should recognize s palindromes" do
  #       Golf.hole3("ABAB").should == false
  #       Golf.hole3("ABBA").should == true
  #     end
  #     it "should recognize s palindromes with odd length" do
  #       Golf.hole3("ABA").should == true
  #     end
  #     it "should recognize s palindromes ignoring case" do
  #       Golf.hole3("AbBa").should == true
  #     end
  #   end
  #   
  
  def self.hole3(s)
    s.downcase == s.downcase.reverse
  end
  
  
    # 
    # describe ".hole4" do
    #   it "should put a hat on every man" do
    #     Golf.hole4(["man(bob)", "man(geoff)", "man(harry)"]).should ==
    #       ["hat(man(bob))", "hat(man(geoff))", "hat(man(harry))"]
    #   end
    # 
    #   it "should feed each dog a bone" do
    #     Golf.hole4(["dog(luna)", "dog(rex)", "dog(spot)"]).should ==
    #       ["dog(luna(bone))", "dog(rex(bone))", "dog(spot(bone))"]
    #   end
    # 
    #   it "should collapse the probability waveform of each cat" do
    #     Golf.hole4(["cat(tiddles)", "cat(miffy)"]).should ==
    #       ["dead(tiddles)", "dead(miffy)"]
    #   end
    # 
    #   it "should do all the above at once" do
    #     Golf.hole4(["man(steve)", "dog(snoopy)", "cat(garfield)"]).should ==
    #       ["hat(man(steve))", "dog(snoopy(bone))", "dead(garfield)"]
    #   end
    # end
    # 
    
    def self.hole4(a)
      # x = a.map do |item|
      #   puts item
      #   item.sub(/man\((\w+)\)/, "hat(man(#{$1}))")
      # end
      # puts x.inspect
      a.map do |item|
        item = item[0..2] == 'man' ? "hat(#{item})" : item
        item = item[0..2] == 'dog' ? "#{item[0..-2]}(bone))" : item
        item.sub('cat', 'dead')
      end
    end
    
    
    # describe ".hole5" do
    #       it "should return all sub-lists of the input, sorted by length then numerically" do
    #         Golf.hole5([1,2,3,4]).should ==
    #           [[1], [2], [3], [4], [1, 2], [2, 3], [3, 4], [1, 2, 3], [2, 3, 4], [1, 2, 3, 4]]
    # 
    #         Golf.hole5([4,10,15,23]).should ==
    #           [[4], [10], [15], [23], [4, 10], [10, 15], [15, 23], [4, 10, 15], [10, 15, 23], [4, 10, 15, 23]]
    #       end
    #     end
    #     
  def self.hole5(a)
    col = []

    0.upto(a.size - 1) do |i|
      0.upto(a.size - i - 1) do |j|
        col << a[j..j+i]
      end
    end

    col
  end
  
  def self.hole6(target)
    # describe ".hole6" do
    #       it "should play fizzbuzz to 3, where multiples of 3 are 'fizz'" do
    #         Golf.hole6(3).should eql [1,2,"fizz"]
    #       end
    # 
    #       it "should play fizzbuzz to 5, with rules above and multiples of 5 are 'buzz'" do
    #         Golf.hole6(5).should eql [1,2,"fizz",4,"buzz"]
    #       end
    # 
    #       it "should play fizzbuzz to 10 with rules above and muliples of 3 and 5 are 'fizzbuzz'" do
    #         Golf.hole6(15).should eql [1,2,"fizz",4,"buzz","fizz",7,8,"fizz","buzz",11,"fizz",13,14,"fizzbuzz"]
    #       end
    # 
    #       it "should play fizzbuzz to 30" do
    #         Golf.hole6(30).should eql [1,2,"fizz",4,"buzz","fizz",7,8,"fizz","buzz",11,"fizz",13,14,"fizzbuzz",16,17,"fizz",19,"buzz","fizz",22,23,"fizz","buzz",26,"fizz",28,29,"fizzbuzz"]
    #       end
    #     end
    #     
    (1..target).to_a.inject([]) do |col, number|
      col << if number % 15 == 0
        "fizzbuzz"
      elsif number % 5 == 0
        "buzz"
      elsif number % 3 == 0
        "fizz"
      else
        number
      end
      col
    end
  end
  
  
  # describe ".hole7" do
  #   it "should collapse consecutive numbers to a range" do
  #     Golf.hole7([1,2,3]).should eql ["1-3"]
  #   end
  # 
  #   it "should keep separate ranges distinct" do
  #     Golf.hole7([1,2,3,5,6,7,100,101]).should eql ["1-3","5-7","100-101"]
  #   end
  # 
  #   it "should show isolated digits on their own" do
  #     Golf.hole7([[1,2,3],[5],[10,11,12]]).should eql ["1-3","5","10-12"]
  #   end
  # end
  # 
  def self.hole7(a)

    old = a[0]
    
    temp_col = [old]
    collection = []
    
    a[1..-1].each_with_index do |item, index|
      if (old + 1) == item
        temp_col << item
      else
        collection << temp_col
        temp_col = [item]
      end
      old = item
    end
    collection << temp_col
    
    collection.map do |x|
      if x.size > 1
        "#{x[0]}-#{x[-1]}"
      else
        x[0].to_s
      end
    end
  end
  
  
  def self.hole8
    
    # describe ".hole8" do
    #   it "should give the first N numbers of the fibonacci sequence" do
    #     Golf.hole8(5).should eql [1,1,2,3,5]
    #   end
    # 
    #   it "should give the first 9 numbers" do
    #     Golf.hole8(9).should eql [1,1,2,3,5,8,13,21,34]
    #   end
    # 
    #   it "should give the first 15 numbers" do
    #     Golf.hole8(15).should eql [1,1,2,3,5,8,13,21,34,55,89,144,233,377,610]
    #   end
    # end
    # 
    
    
    
  end
  
  
  
  
end
