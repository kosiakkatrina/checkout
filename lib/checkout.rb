require "storage"

class Checkout 
    def initialize(discounts = [])
        @scanned_items = []
        @discounts = discounts
    end

    def scan(item)
        if Storage::ITEMS[item]
            @scanned_items << item
        else
            raise "Item \"#{item}\" does not exist"
        end
    end

    def total 
        price_before_discount = @scanned_items.map { |item| Storage::ITEMS[item][:price] }.sum
        final_price = price_before_discount
        @discounts.each { |discount| final_price = discount.call(final_price, @scanned_items) }
        final_price.round(2)
    end
end
