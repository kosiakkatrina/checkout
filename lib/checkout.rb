require "storage"

class Checkout 
    attr_reader :total

    def initialize(discounts = [])
        @total = 0
        @scanned_items = []
        @discounts = discounts
    end

    def scan(item)
        @total += Storage::ITEMS[item][:price]
        @scanned_items << item
        @discounts.each { |discount| @total = discount.call(@total, @scanned_items) }
    end
end
