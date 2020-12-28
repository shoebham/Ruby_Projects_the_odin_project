require './caesar_cipher.rb'
 describe "Caesar_cipher" do
    describe "#caesar_cipher" do
        it "returns encrypted string" do
            expect(Caesar_cipher.new.caesar_cipher("What a string!", 5)).to eql("Bmfy f xywnsl!")
            expect(Caesar_cipher.new.caesar_cipher("1245", 5)).to eql("1245")
        end
    end
end