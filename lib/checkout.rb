require "storage"

class Checkout 
    def initialize(discounts = [])
        @scanned_items = []
        @discounts = discounts
    end

    def scan(item)
        @scanned_items << item
    end

    def total 
        price_before_discount = @scanned_items.map { |item| Storage::ITEMS[item][:price] }.sum
        final_price = price_before_discount
        @discounts.each { |discount| final_price = discount.call(price_before_discount, @scanned_items) }
        final_price
    end
end
