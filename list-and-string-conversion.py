proto_list1 = "3,6,9,12"
proto_list2 = "A;C;M;E"
proto_list3 = "space delimited string"
proto_list4 = "Comma-spaces, might, require, typing, caution"

strings = [proto_list1, proto_list2, proto_list3, proto_list4]


# a) Use the 'in' method to check to see if the words in each string are separated by commas (,), semicolons (;) or just spaces.
for str in strings:
    if " " in str and "," in str:
        print(str," has space and comma")
    elif  "," in str:   
        print(str," has comma")
    elif ";" in str:
        print(str," has semi colon")
    elif " " in str:
        print(str," has space")    


# b) If the string uses commas to separate the words, split it into an array, reverse the entries, and then join the array into a new comma separated string.
       
for str in strings:
    if "," in str:
        words = str.split(",")           # split into list of words
        words.reverse()       # reverse alphabetize (Z–A)
        result = ",".join(words)       # join back with spaces
        print(result)
# c) If the string uses semicolons to separate the words, split it into an array, alphabetize the entries, and then join the array into a new comma separated string.
        
for str in strings:
    if ";" in str:
        words = str.split(";")           # split into list of words
        words.sort()       # reverse alphabetize (Z–A)
        result = "-".join(words)       # join back with spaces
        print(result)        


# d) If the string uses spaces to separate the words, split it into an array, reverse alphabetize the entries, and then join the array into a new space separated string.

for str in strings:
    if " " in str and ", " not in str:
        words = str.split(" ")           # split into list of words
        words.sort(reverse=True)       # reverse alphabetize (Z–A)
        result = " ".join(words)       # join back with spaces
        print(result)

# e) If the string uses ‘comma spaces’ to separate the list, modify your code to produce the same result as part “b”, making sure that the extra spaces are NOT part of the final string.
for str in strings:
    if ", " in str:
        words = str.split(", ")           # split into list of words
        words.reverse()       # reverse alphabetize (Z–A)
        result = ",".join(words)       # join back with spaces
        print(result)