# Create a new file with a random amount of letters and numbers and a size of 500 bytes. 
# Using the file, return the total number of vowels inside using both sed and grep ad wc. 
# Remove all numeral sare return file count.

# Generate a 500 byte file with random letters and numbers. 
< /dev/urandom tr -dc "[:alnum:]" | head -c500 > file.txt

#Outout file count
wc -c "file.txt" | awk '{print $1}'

# Counts all vowels and outputs the count in console. 
grep -i -o 'a\|e\|i\|o\|u'  file.txt | wc -l

# Remove all numbers from the file
sed -i 's/[0-9]//g'  file.txt

#Outout file count
wc -c "file.txt" | awk '{print $1}'
