
def merge_sort(arr)
  return arr if arr.length<2
  puts "array is #{arr}"
  left = merge_sort(arr[0...arr.length/2])
  right = merge_sort(arr[arr.length/2..-1])
  sorted=[]
  puts "left is #{left}"
  puts "right is #{right}"
  while left.length>0 && right.length>0
    if left[0]<right[0]
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  if left.empty?
    right.each {|n| sorted << n}
  else
    left.each {|n| sorted<<n}
  end
  sorted
end
arr = [5,4,1,1,3,6]
puts merge_sort(arr)
