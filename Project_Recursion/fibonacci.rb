def fib(n)
  c=0
  a=0
  b=1
  (n-1).times do
    c = a+b
    puts "c is #{c}"
    a = b
    puts "a is #{a}"
    b = c
   puts "b is #{b}"
  end
  # 0,1,1,2,3,5,8,13,21
  c
end

def fib_rec(n)
 return 0 if n.zero?
 return 1 if n ==1
  fib_rec(n-2) + fib_rec(n-1)
  end
puts fib 47
puts fib_rec 5