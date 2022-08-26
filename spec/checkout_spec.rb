require "checkout"

describe Checkout do
    let(:checkout) { Checkout.new }

    it "has initial total of £0" do 
        expect(checkout.total).to eq(0)
    end

    it "allows the first item to be scanned" do 
        item = "001"
        checkout.scan(item)

        expect(checkout.total).to eq(9.25)
    end

    it "allows the second item to be scanned" do 
        item = "002"
        checkout.scan(item)

        expect(checkout.total).to eq(45.00)
    end
end
