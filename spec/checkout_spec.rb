require "checkout"

describe Checkout do
    it "has initial total of £0" do 
        co = Checkout.new
        expect(co.total).to eq(0)
    end
end
