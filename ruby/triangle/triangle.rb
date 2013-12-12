require 'pry'

  class TriangleError < StandardError; end



class Triangle
  attr_reader :side_a, :side_b, :side_c

  def initialize side_a, side_b, side_c
    @side_a, @side_b, @side_c = side_a, side_b, side_c
  end

  def kind
    raise TriangleError if invalid?
    case
    when isosceles? then :isosceles
    when equilateral? then :equilateral
    else :scalene
    end
  end

  private

  def equilateral?
    side_a == side_b && side_b == side_c
  end

  def isosceles?
    (side_a == side_b || side_a == side_c || side_b == side_c)  && !equilateral?
  end

  def invalid?
    no_size? || negative_side? || triangle_inequality?
  end

  def no_size?
    side_a == 0 && side_b == 0 && side_c == 0
  end

  def negative_side?
    side_a < 0 || side_b < 0 || side_c < 0
  end

  def triangle_inequality?
    (side_a + side_b <= side_c) ||
    (side_a + side_c <= side_b) ||
    (side_b + side_c <= side_a)
  end
end