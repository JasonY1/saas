#For those just starting out, one suggested way to work on your code is to have a command window open and a text editor with this
#file loaded.  Make changes to this file and then run 'ruby part1.rb' at the command line, this will run your program.  Once you're
#satisfied with your work, save your file and upload it to the checker.


def palindrome?(str)
  str.downcase!           #downcase and bang
  str.gsub!(/\W/, "")     #regex remove non-word chars and digits
  str == str.reverse      #tests 2 strings are identical
end

# PALINDROME NOTE: Digits are the string
# 1234 racecar 4321 should work
# 1423 racecar 1234 should not unless: str.gsub!(/\W|\d/, "")

def count_words(str)
  counts = {}                                   #counts number of elements
  str.downcase.scan(/\b[a-z]+/).each do |word|  #downcase/seperate words for word do
    if counts[word].nil? then                   #condition if word exists
      counts[word] = 1                          #word exists assign 1
    else
      counts[word] += 1                         #object summation
    end
  end
  counts                                        #calls counts
end


#the code below this line will test your functions.  You should remove everything below this line prior to submitting your file


test_str = "there goes the neighborhood"

if palindrome? test_str
  puts test_str + " is a palindrome!"
else
  puts test_str + " is NOT a palindrome!"
end


test_str = "Madam, I'm Adam"

if palindrome? test_str
  puts test_str + " is a palindrome!"
else
  puts test_str + " is NOT a palindrome!"
end


test_str = "The rent is due on the first day of the month unless the first day of the month falls on a Saturday or Sunday"

word_count = count_words test_str
puts word_count
