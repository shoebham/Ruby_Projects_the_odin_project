
array = [17,3,6,9,15,8,6,1,10]
def stock_picker(array)
    return_arr = []
    profit=0
    array.each_with_index do |a,i|
        array.each_with_index do |b,j|
            if b-a>profit && j>i
                profit = b-a
                return_arr[0]=i
                return_arr[1]=j
            end
        end
    end
    p return_arr
end

stock_picker(array)