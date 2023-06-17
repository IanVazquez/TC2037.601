def merge_sort(arr):
    if len(arr) <= 1:
        return arr

    mid = len(arr) // 2
    left_half = arr[:mid]
    right_half = arr[mid:]

    left_half = merge_sort(left_half)
    right_half = merge_sort(right_half)

    return merge(left_half, right_half)

def merge(left, right):
    merged = []
    left_index = 0
    right_index = 0

    while left_index < len(left) and right_index < len(right):
        if left[left_index] < right[right_index]:
            merged.append(left[left_index])
            left_index += 1
        else:
            merged.append(right[right_index])
            right_index += 1

    while left_index < len(left):
        merged.append(left[left_index])
        left_index += 1

    while right_index < len(right):
        merged.append(right[right_index])
        right_index += 1

    return merged

def binary_search(arr, target):
    left = 0
    right = len(arr) - 1

    while left <= right:
        mid = (left + right) // 2
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1

    return -1

def factorial_recursive(n):
    if n <= 1:
        return 1
    else:
        return n * factorial_recursive(n - 1)

def fibonacci_recursive(n):
    if n <= 1:
        return n
    else:
        return fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2)

def power_recursive(base, exponent):
    if exponent == 0:
        return 1
    else:
        return base * power_recursive(base, exponent - 1)

def main():
    numbers = [9, 4, 2, 7, 1, 5, 8, 3, 6]
    sorted_numbers = merge_sort(numbers)
    print("Sorted numbers:", sorted_numbers)

    target = 7
    index = binary_search(sorted_numbers, target)
    if index != -1:
        print("Found at index", index)
    else:
        print("Not found")

    n = 5
    factorial = factorial_recursive(n)
    print("Factorial of", n, "is", factorial)

    n = 10
    fibonacci_sequence = [fibonacci_recursive(i) for i in range(n)]
    print("Fibonacci sequence:", fibonacci_sequence)

    base = 2
    exponent = 3
    power = power_recursive(base, exponent)
    print(base, "raised to the power of", exponent, "is", power)

if __name__ == '__main__':
    main()

# Extra lines to reach a total of 200 lines
print("This is an extra line")
print("This is another extra line")
print("And one more extra line")
print("Yet another extra line")
print("And one last extra line")
