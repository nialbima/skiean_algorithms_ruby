# write a program to reverse a singly-linked list
# after the reversal, all pointers should now point backwards

def reverse_singly_linked_list(linked_list)
  new_next = nil
  current_node = linked_list.head

  # keep going until we run out of list elements.
  while current_node
    # grab the current_node's next. save it
    # initially, the first node. later, nil.
    old_next = current_node.next
    # we saved current_node.
    # it's nil to start, but we're setting it to overwrite new_next on every loop.
    current_node.next = new_next

    # initially, nil. at the end, new next is the last node visited.
    # we save this pointer reference so that when current_node is updated,
    # we can point back at new_next.
    new_next = current_node

    # our current_node is the old next we found, and saved, at the top.
    # we do it here because we've stored the pointer aiming at the next node in old_next
    # also, the cycle will terminate gracefully when it finds the end of the list,
    # because that one doesn't have a list.

    # last_node is saved because when we run out of elements, we need to link it
    # back to the head.
    last_node = current_node
    current_node = old_next
  end

  # at the end, we stash the last object we found at the head of the linked list
  # and we haven't created or destroyed anything!
  linked_list.head = last_node

  return linked_list
end

def setup_linked_list
  values = "abcdefgh".split("")
  linked_list = LinkedList.new(values[0])
  values[1..-1].each{ |node| linked_list.add(node) }

  return linked_list
end

# this implementation taken from here: http://wlowry88.github.io/blog/2014/08/20/linked-lists-in-ruby/
# i'll rewrite it if needed.
class Node
  attr_accessor :val, :next

  def initialize(val, next_node)
      @val = val
      @next = next_node
  end
end

class LinkedList
  attr_accessor :head

  def initialize(val)
    @head = Node.new(val, nil)
  end

  def add(val)
    current = @head
    while current.next != nil
      current = current.next
    end
    current.next = Node.new(val, nil)
  end

  def delete(val)
    current.next = @head
    if current.val = val
      @head = current.next
    else
      while (current.next != nil) && (current.next.val != val)
        current = current.next
      end
      unless current.next == nil
        current.next = current.next.next
      end
    end
  end

  def return_list
    elements = []
    current = @head
    while current.next != nil
      elements << current
      current = current.next
    end
    elements << current
  end

  def head
    @head
  end
end
