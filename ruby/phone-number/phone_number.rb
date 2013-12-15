
class PhoneNumber
  attr_reader :number
  INVALID_NUMBER = '0000000000'

  def initialize number
    @number = INVALID_NUMBER
    @number = clean_number(number) if valid?(clean_digits(number))
  end

  def area_code
    @number[0..2]
  end

  def to_s
    "(#{area_code}) #{prefix}-#{identifier}"
  end

  private

  def clean_digits dirty_number
    dirty_number.gsub(/\D/, '')
  end

  def clean_number dirty_number
    clean_digits(dirty_number).chars.last(10).join
  end

  def valid? number
    number.size == 10 || \
    number.size == 11 && number.start_with?('1')
  end

  def prefix
    @number[3..5]
  end

  def identifier
    @number[6..9]
  end
end