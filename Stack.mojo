from python import Python

struct Stack:
    var items: PythonObject
    var py: PythonObject

    fn __init__(inout self, items: PythonObject) raises:
        self.items = items
        self.py = Python.import_module("builtins")

    fn add(inout self, new_item: Int64) raises:
        _ = self.items.append(new_item) # Using the _ variable only to dump the value and avoid warnings.
    
    fn is_empty(inout self) raises -> Bool:
        if self.items == []:
            return True
        else:
            return False

    fn remove(inout self) raises:
        if self.is_empty():
            print("The Stack is empty, there's nothing to delete.")
        else:
            _ = self.items.pop(0) # Using the _ variable only to dump the value and avoid warnings.
    
    fn clear(inout self) raises:
        self.items = []
    
    fn display(inout self):
        print(self.items)
    
    fn peek(inout self) raises -> PythonObject:
        return self.items[0]

    fn size(inout self) raises -> PythonObject:
        return self.py.len(self.items)
    
    """
    fn __iter__(inout self) raises:
        var i = 0

        while i < self.py.len(self.items): # Impossible to use at the moment since len return as PythonObject, not a Integer.
            yield self.items[i]
            i += 1
    """
    

fn main() raises:
    var myStack = Stack([1, 2, 3, 4])
    myStack.display()
    print("The size of the Stack is", myStack.size())

    print("")
    myStack.add(5)
    myStack.add(6)

    print("Peeking at the first item...", myStack.peek())
    myStack.display()
    print("The size of the Stack is", myStack.size())

    print("")
    myStack.remove()
    myStack.remove()
    myStack.remove()
    myStack.remove()
    myStack.display()
    print("The size of the Stack is", myStack.size())

    print("")
    myStack.clear()
    print("Clearing Stack...")
    print("The size of the Stack is", myStack.size())
    print("Trying to remove another item...")
    myStack.remove()