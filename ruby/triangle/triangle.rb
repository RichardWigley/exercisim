require 'pry'

  class TriangleError < StandardError; end



class Triangle

  def initialize side_a, side_b, side_c
    @side_a, @side_b, @side_c = side_a, side_b, side_c
  end

  def kind
    raise TriangleError unless valid?
    case
    when isosceles? then :isosceles
    when equilateral? then :equilateral
    else :scalene
    end
  end

  private

  attr_reader :side_a, :side_b, :side_c

  def equilateral?
    side_a == side_b && side_b == side_c
  end

  def isosceles?
    (side_a == side_b || side_a == side_c || side_b == side_c)  && !equilateral?
  end

  def valid?
    !zero_sized? && positive_sides? && triangle_inequality?
  end

  def zero_sized?
    side_a == 0 && side_b == 0 && side_c == 0
  end

  def positive_sides?
    side_a > 0 && side_b > 0 && side_c > 0
  end

  def triangle_inequality?
    side_a + side_b > side_c &&
    side_a + side_c > side_b &&
    side_b + side_c > side_a
  end
end