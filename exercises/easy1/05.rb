=begin
- Given a list of names that have been encrypted with ROT13
- Decipher and print each name

ROT13:
- substitution cipher that replaces a letter with the 13th letter after it
- 13 = 26 (num of letters) / 2
- HELLO -> URYYB
  alphabet is an array H is index 7, 7-13 = -6 which gives us U

Algorithm:
- define a constant alphabet that is an array of all the letters
  - need uppers and lowers
- define a method that will decrypt/encrypt (rot 13 works both ways)
  - takes one arg, a string
  - iterate through the chars in the string
    - if upper, get corresponding letter in uppers
    - if lower, get corresponding letter in lowers
  - return transformed string
=end
UPPERS = ('A'..'Z').to_a
LOWERS = ('a'..'z').to_a
PIONEERS = ["Nqn Ybirynpr", "Tenpr Ubccre", "Nqryr Tbyqfgvar", "Nyna Ghevat",
            "Puneyrf Onoontr", "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
            "Wbua Ngnanfbss", "Ybvf Unvog", "Pynhqr Funaaba", "Fgrir Wbof",
            "Ovyy Tngrf", "Gvz Orearef-Yrr", "Fgrir Jbmavnx", "Xbaenq Mhfr",
            "Fve Nagbal Ubner", "Zneiva Zvafxl", "Lhxvuveb Zngfhzbgb", 
            "Unllvz Fybavzfxv", "Tregehqr Oynapu"]

def rot13_chr(char)
  index = LOWERS.index(char.downcase)
  if UPPERS.include?(char)
    UPPERS[index - 13]
  elsif LOWERS.include?(char)
    LOWERS[index - 13]
  else
    char
  end
end

def rot13(str)
  str.chars.map{ |char| rot13_chr(char) }.join
end

def display_decrypted_pioneers
  PIONEERS.each do |pioneer|
    puts rot13(pioneer)
  end
end

display_decrypted_pioneers