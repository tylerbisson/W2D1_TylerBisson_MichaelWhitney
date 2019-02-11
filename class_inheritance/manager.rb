require_relative "employee.rb"

class Manager < Employee
    attr_accessor :total_subordinate_salary, :assigned_employees
    def initialize(name, title, salary)
        super
        @assigned_employees = []
        @total_subordinate_salary = 0
    end

    def bonus(multiplier)
        @bonus = @total_subordinate_salary * multiplier
    end

    def add_employee(employee)
        employee.boss = self
        self.assigned_employees << employee
        self.total_subordinate_salary += employee.salary
    end 
end