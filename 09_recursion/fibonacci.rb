# frozen_string_literal: true

def fibs(value)
  # use iteration
  result = []

  (0..value).each do |i|
    result[i] = 0 if i.zero?
    result[i] = 1 if i == 1
    result[i] = result[i - 1] + result[i - 2] if i > 1
  end

  result
end

def fibs_rec(value, result = [], orig_n = value)
  result[0] = 0 if value.zero?
  result[1] = 1 if value == 1

  if value > 1
    result[value] = fibs_rec(value - 1, result, orig_n) +
                    fibs_rec(value - 2, result, orig_n)
  end

  return [0, 1] if orig_n == 1
  return result if value == orig_n

  result[value]
end

p fibs(0)
p fibs_rec(0)

p fibs(1)
p fibs_rec(1)

p fibs(5)
p fibs_rec(5)

p fibs(20)
p fibs_rec(20)
