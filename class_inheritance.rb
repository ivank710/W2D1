class Employee
  attr_reader :name, :title, :boss
  attr_accessor :salary
  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary *= multiplier
  end
end

class Manager < Employee
  attr_reader :employees 
  def initialize(name, title, salary, boss = nil)
    super(name, title, salary, boss)
    @employees = Array.new 
  end 

  def add_employee(employee)
    @employees << employee
  end

  def bonus(multiplier)
    total_employee_salary = 0
    @employees.each do |employee|
      total_employee_salary += employee.salary
    end
    total_employee_salary * multiplier
  end
end

ned = Manager.new("Ned", "Founder", 10000000)
darren = Employee.new("Darren", "TA Manager", 78000, ned)
ned.add_employee(darren)
puts ned.bonus(5)
puts darren.bonus(4)