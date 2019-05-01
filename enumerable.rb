#author: Noordeen Malango
#programme : Enumerable Methods

module Enumerable
  #implementation of my_each method similar to each Method
  def my_each
    i = 0
    loop {yield(self[i]); i +=1; break if i == self.length}
  end
 #implementation of my_each_with_index similar to each_with_index method
 def my_each_with_index
   i = 0
   loop {yield(self[i], self.index(self[i])); i +=1; break if i == self.length}
 end

 #implementation of my_select similar to select method
 def my_select
   new_arr = []
   self.my_each {|element| new_arr << element if yield(element)}
   new_arr
 end
#implementation of my all similar to all Method
 def my_all?
    false_count = 0
    self.my_each {|element| false_count += 1 if !yield(element)}
    return false if false_count > 0
    return true
  end
#implementation of my_any
def my_any?
    status = false
    self.my_each {|element|  status = true  if yield(element)}
    return status
end

#implementation of my_none similar to none Method
def my_none?
    status = true
    self.my_each {|element| status = false  if yield(element)}
    return status
end
#implementation of my_count method similar to count Method
def my_count
    count = 0
    self.my_each {|element| count += 1  if yield(element)}
    return count
end

#implementation of my_map method similar to map  method
def my_map
    new_arry = []
    self.my_each {|element| new_arry << yield(element)}
    return new_arry
end

#implementation of my_inject method similar to inject method
def my_inject(memo)
    self.my_each {|element| memo = yield(memo,element)}
    return memo
end

end

def multiply_els(memo, obj)
    obj.my_inject(memo){|holder, element| holder * element}
end

#test case for multiply_els
#puts multiply_els(1,[2,4,5])

#test cases
my_array = [1,2,3,4]
#puts my_array.each {|num| puts num*2}
#puts my_array.my_each{|num| puts num *2}

#puts my_array.each_with_index {|num,i| puts "#{num} in position #{i}"}
#puts my_array.my_each_with_index {|num,i| puts "#{num} in position #{i}"}

#puts my_array.select {|num| num%2 == 0}
#puts my_array.my_select {|num| num%2 == 0}

# puts my_array.all? {|num| num  < 5}
# puts my_array.my_all? {|num| num < 5}
# puts my_array.all? {|num| num  > 5}
# puts my_array.my_all? {|num| num > 5}

# puts my_array.any? {|num| num > 5}
# puts my_array.my_any? {|num| num > 5}
# puts my_array.any? {|num| num >= 4}
# puts my_array.my_any? {|num| num >= 4}

# puts my_array.none? {|num| num > 5}
# puts my_array.my_none? {|num| num > 5}
# puts my_array.none? {|num| num < 5}
# puts my_array.my_none? {|num| num < 5}

#puts my_array.count {|num| num < 4}
#puts my_array.my_count {|num| num < 4}

my_proc = Proc.new {|x| x * 3}

puts my_array.map(&my_proc)
puts my_array.my_map(&my_proc)
puts my_array.map {|x| x * 3}
puts my_array.my_map {|x| x * 3}

#puts my_array.inject(0) {|memo, element| memo + element}
#puts my_array.my_inject(0) {|memo, element| memo + element}
