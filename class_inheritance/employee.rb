class Employee
    attr_reader :name, :title, :salary
    attr_accessor :boss

    def initialize (name, title, salary)
        @name = name 
        @title = title
        @salary = salary
        @boss = ""
    end

    def bonus(multiplier)
        @bonus = salary * multiplier
    end
end

