# Caesar Cipher
# frozen_string_literal: true

def same_case?(chr, test_chr)
  chr =~ /[A-Z]/ && test_chr.chr =~ /[A-Z]/ ||
    chr =~ /[a-z]/ && test_chr.chr =~ /[a-z]/
end

def add_offset(chr, offset)
  test_chr = chr.ord + (offset % 26)

  if same_case?(chr, test_chr)
    test_chr.chr
  elsif chr =~ /[a-zA-Z]/
    test_chr - 26
  else
    chr
  end
end

def caesar(string, offset)
  ord_orig = string.split('')
  ord_new = []

  ord_orig.each do |chr|
    chr = add_offset(chr, offset)
    ord_new << chr
  end

  ord_new.map(&:chr).join
end

# puts caesar('What a string!', 5)  # "Bmfy f xywnsl!"
# puts caesar('Hello, World!', 5)   # 'Mjqqt, Btwqi!'
# puts caesar('Mjqqt, Btwqi!', -5)  # 'Hello, World!'
# puts caesar('Z', 1)               # 'A'
# puts caesar('Hello, World!', 75)  # 'Ebiil, Tloia!'
# puts caesar('Hello, World!', -29) # 'Ebiil, Tloia!'
