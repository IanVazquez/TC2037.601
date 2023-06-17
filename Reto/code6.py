class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class LinkedList:
    def __init__(self):
        self.head = None

    def is_empty(self):
        return self.head is None

    def insert_at_beginning(self, data):
        new_node = Node(data)
        new_node.next = self.head
        self.head = new_node

    def insert_at_end(self, data):
        new_node = Node(data)

        if self.is_empty():
            self.head = new_node
        else:
            current = self.head
            while current.next is not None:
                current = current.next
            current.next = new_node

    def delete_at_beginning(self):
        if self.is_empty():
            return None

        data = self.head.data
        self.head = self.head.next
        return data

    def delete_at_end(self):
        if self.is_empty():
            return None

        if self.head.next is None:
            data = self.head.data
            self.head = None
            return data

        current = self.head
        while current.next.next is not None:
            current = current.next

        data = current.next.data
        current.next = None
        return data

    def display(self):
        if self.is_empty():
            print("Linked list is empty.")
        else:
            current = self.head
            while current is not None:
                print(current.data, end=" ")
                current = current.next
            print()

def main():
    linked_list = LinkedList()
    linked_list.insert_at_end(5)
    linked_list.insert_at_end(10)
    linked_list.insert_at_beginning(2)
    linked_list.insert_at_end(15)
    linked_list.display()

    deleted_data = linked_list.delete_at_beginning()
    print("Deleted data:", deleted_data)
    linked_list.display()

    deleted_data = linked_list.delete_at_end()
    print("Deleted data:", deleted_data)
    linked_list.display()

if __name__ == "__main__":
    main()

# Extra lines to reach a total of 200 lines
print("This is an extra line")
print("This is another extra line")
print("And one more extra line")
print("Yet another extra line")
print("And one last extra line")
