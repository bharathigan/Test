# ---- Exercise 2: Bracket Notation Basics ----

text = 'Strings_are_sequences_of_characters.'
word = 'tomato'

# 1. Print a slice of the first 12 characters from 'text'.

print(text[:12])
# 2. Print a slice of the last 12 characters from 'text'. You should NOT have to count the index values yourself!

print(text[-12:])
# 3. Print a slice of the middle 12 characters from 'text'.
middle_index = len(text)//2
print(text[middle_index - 6 : middle_index + 6])

# ---- Exercise 3: Looping Through a String ----

# Use index values to loop backwards through 'word'.

# 1. Print 1 letter per line.

for i in range(len(word) - 1, -1, -1):
    print(word[i])
# 2. Refactor the code to use the accumulator pattern to build up and print the reversed string. For example, if given 'good', print 'doog' on one line.

reverse_word = ''
for ch in word:
    reverse_word = ch + reverse_word   # adds character to front each time
print(reverse_word)
# 3. Refactor the code to print a combination of the original and reversed string. For example, given 'tomato', print 'tomatootamot'. (If you want to be fancy, print 'tomato | otamot').
reverse_word = ''
for ch in word:
    reverse_word = ch + reverse_word   # adds character to front each time
print(word + reverse_word)
print(word +" | " + reverse_word)
print(f"{word} | {reverse_word}")