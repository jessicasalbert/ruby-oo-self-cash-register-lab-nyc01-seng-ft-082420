class CashRegister

    attr_accessor :total
    attr_accessor :discount
    attr_accessor :items
    attr_accessor :last

    def initialize(discount=nil)
        @total = 0 
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        self.total += price * quantity
        quantity.times { @items << title}
        self.last = [title, price, quantity]
    end

    def apply_discount
        if @discount 
            self.total *= (100 - @discount)
            self.total /= 100
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total -= @last[1] * @last[2]
        @last[2].times { self.items.pop }
        self.total
    end


end
