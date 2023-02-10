require 'pry'

class CashRegister

    attr_accessor :items, :discount, :total, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.last_transaction = price * quantity
        self.total += self.last_transaction
        quantity.times do
            self.items << title
        end
    end

    def apply_discount
        discount_amount = (total * (discount / 100.0)).to_i
        if discount_amount > 0
          self.total -= discount_amount
          "After the discount, the total comes to $#{self.total}."
        else
          "There is no discount to apply."
        end
      end


    def void_last_transaction
        self.total -= self.last_transaction
    end

end
