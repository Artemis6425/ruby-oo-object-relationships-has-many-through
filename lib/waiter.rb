class Waiter
    @@all = []
    def initialize(name, xp)
        @name = name
        @experience = xp
        @@all << self
    end
    attr_accessor :name, :experience
    def self.all
        @@all
    end
    def new_meal(customer, total, tip=0)
        Meal.new(self,customer,total,tip)
    end
    def meals
        Meal.all.select do |temp|
            temp.waiter == self
        end
    end
    def best_tipper
        best_tip = meals.max do |a, b|
            a.tip <=> b.tip
        end
        best_tip.customer
    end
end