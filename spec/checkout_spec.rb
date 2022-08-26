require "checkout"

describe Checkout do
    let(:checkout) { Checkout.new }
    let(:fist_item) { "001" }
    let(:second_item) { "002" }
    let(:third_item) { "003" }

    it "has initial total of £0" do 
        expect(checkout.total).to eq(0)
    end

    it "allows the first item to be scanned" do 
        checkout.scan(fist_item)

        expect(checkout.total).to eq(9.25)
    end

    it "allows the second item to be scanned" do 
        checkout.scan(second_item)
        
        expect(checkout.total).to eq(45.00)
    end

    it "allows schanning multiple items" do 
        checkout.scan(second_item)
        checkout.scan(third_item)

        expect(checkout.total).to eq(64.95)
    end
end
