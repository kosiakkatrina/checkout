require "checkout"

describe Checkout do
    it "has initial total of £0" do 
        co = Checkout.new
        expect(co.total).to eq(0)
    end

    it "allows items to be scanned" do 
        co = Checkout.new
        item = "001"
        co.scan(item)
        
        expect(co.total).to eq(9.25)
    end
end
