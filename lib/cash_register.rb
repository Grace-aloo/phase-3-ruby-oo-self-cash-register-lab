class CashRegister
    attr_accessor :total, :discount, :items, :prices
  
    def initialize(discount=0)
      @total = 0
      @discount = discount
      @items = []
      @prices = []
    end
  
    def add_item(title, price, quantity=1)
      self.total += price * quantity
      self.prices << price
      quantity.times { self.items << title }
    end
  
    def apply_discount
      if self.discount == 0
        "There is no discount to apply."
      else
        discount_as_percent = (100.0 - self.discount.to_f) / 100
        self.total = (self.total * discount_as_percent).to_i
        #self.total -= self.total * self.discount / 100.0
        "After the discount, the total comes to $#{self.total.round(2)}."
      end
    end
  
    
  
    def void_last_transaction
        if @items.empty?
          self.total = 0.0
        else
            last_price = @prices.pop
            self.total -= last_price.to_f
        end
    end
  end