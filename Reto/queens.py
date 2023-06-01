def is_safe(board, row, col):
    # Check the current row
    for i in range(col):
        if board[row][i] == 1:
            return False
    
    # Check the upper left diagonal
    i = row
    j = col
    while i >= 0 and j >= 0:
        if board[i][j] == 1:
            return False
        i -= 1
        j -= 1
    
    # Check the lower left diagonal
    i = row
    j = col
    while i < 8 and j >= 0:
        if board[i][j] == 1:
            return False
        i += 1
        j -= 1
    
    return True


def solve_eight_queens():
    board = [[0] * 8 for _ in range(8)]

    if not solve_util(board, 0):
        print("No solution found.")
        return False

    print_board(board)
    return True


def solve_util(board, col):
    if col >= 8:
        return True

    for row in range(8):
        if is_safe(board, row, col):
            board[row][col] = 1

            if solve_util(board, col + 1):
                return True

            board[row][col] = 0

    return False


def print_board(board):
    for row in range(8):
        for col in range(8):
            print(board[row][col], end=" ")
        print()

        
# Run the function to solve the problem
solve_eight_queens()
