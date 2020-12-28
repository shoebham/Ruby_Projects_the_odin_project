
class Calculator
    def add(a,b,c=0)
        a+b+c
    end
    def sub(a,b)
        b-a
    end
    def mult(a,b)
        a*b
    end
    def div(a,b)
        a/b
    end

    def methods(a,b)
        add(a,b)
        sub(a,b)
        mult(a,b)
        div(a,b)
    end

end