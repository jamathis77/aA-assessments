# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  encoded_str = ''
  alphabet_arr = ("a".."z").to_a
  encoded_alphabet_arr = alphabet_arr.rotate(shift)

  str.chars.each do |el|
    index = alphabet_arr.find_index(el)
    if el == ' '
      encoded_str << ' '
    else
      encoded_str << encoded_alphabet_arr[index]
    end
  end
  encoded_str
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
  return num if num < 10
  adder = num % 10
  bottom = adder + digital_root(num/10)
  if bottom < 10
    return bottom
  else
    digital_root(bottom)
  end
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  sorted = []
  return str.chars.sort.join if alphabet == nil

  alphabet.each do |letter|
    add_count = str.chars.count(letter)
    puts add_count
    add_count.times do |num|
      sorted << letter
    end
  end
  sorted.join
end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    pairs = []
        (0...self.length).each do |i|
          ((i + 1)...self.length).each do |j|
            pairs << [i, j] if self[i] + self[j] == 0
          end
        end
        pairs
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    arr = []
    dictionary.each do |el|
      if self.include?(el)
        arr << el
      end
    end

    arr
  end

end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  factors = []
  i = 1
  while i < num
    factors << i if num % i == 0
    i += 1
  end

  factors.sort

end
