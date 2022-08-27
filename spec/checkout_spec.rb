require "checkout"
require "storage"

describe Checkout do
    let(:checkout) { Checkout.new }
    let(:first_item) { "001" }
    let(:second_item) { "002" }
    let(:third_item) { "003" }

    context "with no discounts" do
        it "has initial total of £0" do 
            expect(checkout.total).to eq(0)
        end

        it "allows the first item to be scanned" do 
            checkout.scan(first_item)

            expect(checkout.total).to eq(9.25) 
        end

        it "allows the second item to be scanned" do 
            checkout.scan(second_item)

            expect(checkout.total).to eq(45.00)
        end

        it "allows scanning multiple items" do 
            [second_item, third_item].each { |item| checkout.scan(item)}

            expect(checkout.total).to eq(64.95)
        end
    end

    context "when applying discounts" do
        def over_60_discount(total, *args)
            total >= 60 ? total * 0.9 : total
        end

        def very_cheap_chairs_discount(total, items)
            items.count("001") > 1 ? total - Storage::ITEMS["001"][:bulk_discount_amount] * items.count("001") : total
        end

        it "applies a provided total discount" do
            discounted_checkout = Checkout.new([method(:over_60_discount)])
            [first_item, second_item, third_item].each { |item| discounted_checkout.scan(item)}

            expect(discounted_checkout.total).to eq(66.78)
        end

        it "applies a provided item discount" do
            discounted_checkout = Checkout.new([method(:very_cheap_chairs_discount)])
            [first_item, third_item, first_item].each { |item| discounted_checkout.scan(item)}

            expect(discounted_checkout.total).to eq(36.95)
        end

        it "applies multiple provided discounts" do
            discounted_checkout = Checkout.new([method(:very_cheap_chairs_discount), method(:over_60_discount)])
            [first_item, second_item, first_item, third_item].each { |item| discounted_checkout.scan(item)}

            expect(discounted_checkout.total).to eq(73.76)
        end
    end
end
