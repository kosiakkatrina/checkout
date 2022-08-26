class Checkout 
    attr_reader :total

    ITEMS = { "001" => { price: 9.25 }, "002" => { price: 45.00 }, "003" => { price: 19.95 } }

    def initialize(discounts = [])
        @total = 0
        @discounts = discounts
    end

    def scan(item)
        @total += ITEMS[item][:price]
        @discounts.each { |discount| @total = discount.call(total) }
    end
end
