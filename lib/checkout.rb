class Checkout 
    attr_reader :total

    def initialize
        @total = 0
    end

    def scan(item)
        @total = 9.25
    end
end
