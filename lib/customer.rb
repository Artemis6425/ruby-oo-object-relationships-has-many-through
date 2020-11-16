class Customer
    @@all = []
    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end
    attr_accessor :name, :age
    def self.all
        @@all
    end
    def new_meal(waiter, total, tip=0)
        Meal.new(waiter,self,total,tip)
    end
    def meals
        Meal.all.select do |temp|
            temp.customer == self
        end
    end
    def waiters
        meals.map do |temp|
            temp.waiter
        end
    end
end