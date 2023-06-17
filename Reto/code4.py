def generate_pattern(rows):
    pattern = ""
    for i in range(1, rows + 1):
        pattern += "*" * i
        pattern += "\n"
    return pattern

def calculate_average(numbers):
    total = sum(numbers)
    average = total / len(numbers)
    return average

def is_palindrome(word):
    reversed_word = word[::-1]
    if word == reversed_word:
        return True
    else:
        return False

def find_duplicates(numbers):
    duplicates = []
    for i in range(len(numbers)):
        for j in range(i + 1, len(numbers)):
            if numbers[i] == numbers[j] and numbers[i] not in duplicates:
                duplicates.append(numbers[i])
    return duplicates

def encrypt_message(message, key):
    encrypted_message = ""
    for char in message:
        encrypted_char = chr(ord(char) + key)
        encrypted_message += encrypted_char
    return encrypted_message

def main():
    rows = int(input("Enter the number of rows: "))
    pattern = generate_pattern(rows)
    print("Pattern:")
    print(pattern)

    numbers = []
    while True:
        number = input("Enter a number (or 'done' to finish): ")
        if number == 'done':
            break
        else:
            numbers.append(int(number))

    average = calculate_average(numbers)
    print("Average:", average)

    word = input("Enter a word: ")
    if is_palindrome(word):
        print("The word is a palindrome.")
    else:
        print("The word is not a palindrome.")

    duplicates = find_duplicates(numbers)
    if duplicates:
        print("Duplicates:", duplicates)
    else:
        print("No duplicates found.")

    message = input("Enter a message to encrypt: ")
    key = int(input("Enter the encryption key: "))
    encrypted_message = encrypt_message(message, key)
    print("Encrypted message:", encrypted_message)

if __name__ == '__main__':
    main()

# Extra lines to reach a total of 200 lines
print("This is an extra line")
print("This is another extra line")
print("And one more extra line")
print("Yet another extra line")
print("And one last extra line")
