require_relative "employee"

class Manager < Employee
  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    all_salaries = @employees.inject(0) { |total, employee| total += employee.salary}
    all_salaries * multiplier
  end
end
if __FILE__ == $PROGRAM_NAME
  shawna = Employee.new("Shawna", "TA", 12000, "Darren")
  david = Employee.new("David", "TA", 10000, "Darren")
  darren = Manager.new("Darren", "TA Manager", 78000, "Ned", [shawna, david])
  ned = Manager.new("Ned", "Founder", 1000000, nil, [darren, shawna, david])
  puts ned.bonus(5) # => 500_000
  puts darren.bonus(4) # => 88_000
  puts david.bonus(3) # => 30_000
end
