require 'pry'

DIGITS = { 1000 => 'M', 900 => 'CM',
           500 => 'D', 400 => 'CD',
           100 => 'C', 90 => 'XC',
           50 => 'L', 40 => 'XL',
           10 => 'X', 9 => 'IX',
           5 => 'V', 4 => 'IV',
           1 => 'I' }.freeze

ROMAN = {"M"=>1000,
  "CM"=>900,
  "D"=>500,
  "CD"=>400,
  "C"=>100,
  "XC"=>90,
  "L"=>50,
  "XL"=>40,
  "X"=>10,
  "IX"=>9,
  "V"=>5,
  "IV"=>4,
  "I"=>1}.freeze

def int_to_roman(num)
  roman_num = []
  DIGITS.each do |digit, roman|
    break if num.zero?

    fits_times = num / digit

    num = num % digit

    fits_times.times { roman_num << roman }
  end

  roman_num
end

def roman_to_int(roman_num)
  num = 0
  roman_num = roman_num.split('')

  while roman_num.any?
    first = roman_num.shift
    second = roman_num.shift
    pair = first && second ? first + second : nil

    if ROMAN.key?(pair)
      num += ROMAN[pair]
    else
      num += ROMAN[first]
      roman_num.unshift(second)
    end
  end

  num
end

p int_to_roman(58)

# p roman_to_int("LVIII") == 58

p roman_to_int("MDCXCV")


