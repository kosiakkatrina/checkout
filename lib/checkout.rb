class Checkout 
    attr_reader :total

    ITEMS = { "001" => { price: 9.25 }, "002" => { price: 45.00 } }

    def initialize
        @total = 0
    end

    def scan(item)
        @total = ITEMS[item][:price]
    end
end
