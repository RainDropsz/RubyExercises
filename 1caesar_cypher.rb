=begin
Caesar Cipher
=end

def caesar(string, offset)
  #A-Z = 65-90  a-z = 97-122
  offset = offset % 26
  ord_orig = string.split("").map { |char| char.ord }
  ord_new = []

  ord_orig.each do |chr|
    test_chr = chr + offset

    if chr.between?(65,90) 
      test_chr.between?(65, 90) ? 
      chr = test_chr : 
      chr = test_chr - offset/offset.abs * 26
    elsif chr.between?(97, 122)
      test_chr.between?(97, 122) ? 
      chr = test_chr : 
      chr = test_chr - offset/offset.abs * 26
    end

    ord_new.push(chr)

  end 

  newstr = ord_new.map { |char| char.chr }.join
end

puts caesar("What a string!", 5)  # "Bmfy f xywnsl!"
puts caesar('Hello, World!', 5)   # 'Mjqqt, Btwqi!'
puts caesar('Mjqqt, Btwqi!', -5)  # 'Hello, World!'
puts caesar('Z', 1)               # 'A'
puts caesar('Hello, World!', 75)  # 'Ebiil, Tloia!'
puts caesar('Hello, World!', -29) # 'Ebiil, Tloia!'
