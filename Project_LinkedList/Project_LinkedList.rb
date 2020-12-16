class LinkedList

    def initialize
        @head =nil
        @tail =nil
    end
    def append(value)
        current_node = @head
        until current_node.next==nil
            current_node=current_node.next
        end
        current_node = Node.new(value)
    end

    def prepend(value)
        last_head = @head
        @head = Node.new(value)
        @head.next = last_head
    end
    
    def size
        current_node = @head
        count=0
        while current_node do
            current_node=current_node.next
            count+=1
        end
        if !@head 
            return 0;
        end
    end

    def head
        @head.value
    end
    
    def tail
        until current_node.next==nil
            @tail = current_node.next
        end
        return @tail.value
    end

    def at(index)
        current_node = @head
        current=0
        until current == index
            current_node = current_node.next
            current+=1
        end
        current_node.value
    end

    def pop
        return 0 if !@head
        current_node = current_node.next until current_node.next == @tail
        current_node.next=nil;
    end

    def contains?(value)
        flag=false
        current_node=@head
        until current_node ==nil
            flag = true if current_node.value=value
            current_node=current_node.next
        end
        flag
    end

    def find(value)

        current_node =@head
        index=0
        index_value=nil

        until current_node == nil
            index_value = index if current_node.value==value
            current_node = current_node.next
            index+=1
        end
        index_value || nil
    end

    def to_s
        current_node=@head 
        until current_node == nil
            print "current value is #{current_node.value} "
            current_node= current_node.next
        end
    end
end

class Node
attr_accessor :next,value;

    def initialize(value)
        @value=nil
        @next=nil
    end
end

list =  LinkedList.new

