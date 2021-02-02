require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, presence: true
  validates :last_name , presence: true
  validates :hourly_rate, numericality: {only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200}
  validates :store, presence: true

  def legal_pay?
    (hourly_rate > 40 && hourly_rate < 200)
  end
end

@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
puts Employee.count