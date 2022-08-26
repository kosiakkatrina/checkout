class Checkout 
    attr_reader :total

    def initialize
        @total = 0
    end

    def scan(item)
        if item == "001"
            @total = 9.25
        else
            @total = 45.00
        end
    end
end
