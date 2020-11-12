array = [4,3,78,2,0,2]


def bubble_sort(array)
    (array.length-1).times do |i|
        (array.length-i-1).times do |j|
            if array[j]>array[j+1]
                temp = array[j]
                array[j]=array[j+1]
                array[j+1]=temp
            end
        end
    end
    p array
end
bubble_sort(array)