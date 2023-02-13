class CashRegister
    attr_accessor :total
    
    def initialize(discount=0)
      @total = 0
      @discount = discount
      @items = []
    end
    
    def add_item(title, price, quantity=1)
      @total += price * quantity
      quantity.times { @items << [title, price] }
    end
    
    def apply_discount
      if @discount == 0
        "There is no discount to apply."
      else
        @total -= @total * @discount / 100
        "After the discount, the total comes to $#{@total.round(2)}."
      end
    end
    
    def items
      @items.map(&:first)
    end
    
    def void_last_transaction
      last_item = @items.pop
      return @total = 0.0 if last_item.nil?
  
      @total -= last_item[1]
    end
  end