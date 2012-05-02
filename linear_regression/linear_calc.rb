#!/usr/bin/env ruby

require 'pry'

points = [
  [3, 2],
  [1, 2],
  [0, 1],
  [4, 3]
]

def create_linear_function(*params)
  return Proc.new do |x|
    params[0] + params[1] * x
  end
end

def calculate_cost_of_hypothesis(hypothesis, points)
  sum = points.reduce(0) do |acc, point|
    acc + (hypothesis.call(point[0]) - point[1]) ** 2
  end
  sum.to_f / (2 * points.length)
end

puts calculate_cost_of_hypothesis(
  create_linear_function(0, 1),
  points
)


