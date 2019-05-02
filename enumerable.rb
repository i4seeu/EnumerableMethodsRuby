#author: Noordeen Malango
#programme : Enumerable Methods
#Date: 01/05/2019

module Enumerable

  def my_each
    return self.to_enum unless block_given?
    i = 0
    loop {yield(self[i]); i +=1; break if i == self.length}
    self
  end

 def my_each_with_index
   return self.length.to_enum unless block_given?
   i = 0
   loop {yield(self[i], self.index(self[i])); i +=1; break if i == self.length}
   self
 end


 def my_select
   return self.length.to_enum unless block_given?
   new_arr = []
   self.my_each {|element| new_arr << element if yield(element)}
   new_arr
 end

 def my_all?
    return self.length.to_enum unless block_given?
    false_count = 0
    self.my_each {|element| false_count += 1 if !yield(element)}
    return false if false_count > 0
    return true
  end

def my_any?
    return self.length.to_enum unless block_given?
    status = false
    self.my_each {|element|  status = true  if yield(element)}
    return status
end


def my_none?
    return self.length.to_enum unless block_given?
    status = true
    self.my_each {|element| status = false  if yield(element)}
    return status
end

def my_count
    return self.length.to_enum unless block_given?
    count = 0
    self.my_each {|element| count += 1  if yield(element)}
    return count
end


def my_map
    new_arry = []
    self.my_each {|element| new_arry << yield(element)}
    return new_arry
end


def my_inject(memo)
    self.my_each {|element| memo = yield(memo,element)}
    return memo
end

end

def multiply_els(memo, obj)
    obj.my_inject(memo){|holder, element| holder * element}
end
