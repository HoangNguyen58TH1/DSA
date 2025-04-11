class MyQueue
    def initialize()
        @stack1 = []
        @stack2 = []
    end

    attr_accessor :stack1, :stack2

    def push(x)
        stack1.push(x)
    end

    def pop()
        if(stack2.empty?)
            while(!stack1.empty?)
                stack2.push(stack1.pop)
            end
        end
        stack2.pop
    end

    def peek()
        if(stack2.empty?)
            while(!stack1.empty?)
                stack2.push(stack1.pop)
            end
        end
        stack2.last
    end

    def empty()
        stack1.empty? && stack2.empty?
    end
end

# Your MyQueue object will be instantiated and called as such:
# obj = MyQueue.new()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.peek()
# param_4 = obj.empty()

# tc1:
# ["MyQueue","push","push","peek","pop","empty"]
# [[],[1],[2],[],[],[]]
# Output: [null, null, null, 1, 1, false]

obj = MyQueue.new()
obj.push(1)
obj.push(2)
param_1 = obj.peek()
param_2 = obj.pop()
param_3 = obj.empty()

pp [nil, nil, nil, param_1, param_2, param_3]