require './lib/calculator'
describe Calculator do 
    describe "#add" do 
        it "returns the sum of two numbers" do 
            calc  = Calculator.new
            expect(calc.add(2,3)).to eql(5)
        end
        it "returns the sum of three numbers" do 
            calc = Calculator.new
            expect(calc.add(1,2,3)).to eql(6)
        end
    end

    describe "#methods" do
        it "returns all the methods" do 
            calc = Calculator.new
            expect(calc.add(68,1)).to eql(69)
            expect(calc.sub(1,70)).to eql(69)
            expect(calc.mult(23,3)).to eql(69)
            expect(calc.div(138,2)).to eql(69)
        end
    end

end