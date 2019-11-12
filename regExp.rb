myString = "test1@softserveinc.com\n
test1@softserveinc.com\n
test1@softserveinc.com\n
nAtAshA@gmail.com\n
iryska666@i.ua"
arr = Array.new
arr << myString.match(/^[a-zA-Z0-9]+@[a-z]+\.[a-z]+$/)
puts arr


arr2 = [1,2,3,4,5,6,7]
arr2 = arr2.each_slice(4).to_a
arr2.each { |x| x.each {|y| puts "#{y}-----"}}
