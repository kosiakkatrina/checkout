class Checkout 
    attr_reader :total

    ITEMS = { "001" => { price: 9.25, bulk_discount_amount: 0.75 }, "002" => { price: 45.00 }, "003" => { price: 19.95 } }

    def initialize(discounts = [])
        @total = 0
        @scanned_items = []
        @discounts = discounts
    end

    def scan(item)
        @total += ITEMS[item][:price]
        @scanned_items << item
        @discounts.each { |discount| @total = discount.call(@total, @scanned_items) }
    end
end
