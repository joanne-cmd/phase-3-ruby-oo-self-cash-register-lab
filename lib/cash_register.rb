class CashRegister
    
    attr_reader :discount, :total
    def initialize(discount=nil)
        @discount=discount
        @total=0
        @items=[]
    end
    def total=(value)
        @total=value
    end
    def add_item(title, price, quantity=1)
        self.total=( total+ price* quantity)
        quantity.times do
            @items.push({title:title, price:price})
        end
    end
    def  apply_discount
        if(discount==nil)
            return "There is no discount to apply."
        else
            self.total=(total*(100-discount)/100)
            return "After the discount, the total comes to $#{total}."
        end

    end
    def items
        @items.map do |item|
            item[:title]
        end
    end
    def void_last_transaction
        last_item = @items[-1]
       filtered_items = @items.filter do |item|
                            item[:title]==last_item[:title]
                        end
        filtered_items.each do |item|
            self.total=(total - item[:price])
        end
        
              
    end
    
      
end
