arr = [1,2,3,4,5,6,7]
arr = arr.each_slice(4).to_a
arr.each { |x| x.each {|y| puts "#{y}-----"}}
