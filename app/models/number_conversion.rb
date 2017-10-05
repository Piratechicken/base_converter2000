class NumberConversion < ApplicationRecord

  validates :number, numericality: { greater_than_or_equal_to: 0 }
  validates :base, numericality: { greater_than_or_equal_to: 2 }

  def result
    number_to_base(self.number, self.base)
  end

  DIGITS = ('0'..'9').to_a + ('a'..'z').to_a
    
  def number_to_base(number, base)
    is_negative = number < 0
    number = -number if is_negative
    return '0' if number == 0
    return 'indeterminate' if base < 2
    output = ''

    while number > 0
      bit = number % base
      letter = DIGITS[bit]
      output = letter + output
      number = number / base
    end
    
    output = '-' + output if is_negative
    output
  end

end
