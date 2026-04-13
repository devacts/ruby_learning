# Implementing an Enumerable in a 'collection' class
To implement the Enumerable module in a custom Ruby class, you must follow two primary steps: include the module and define an each method

## Implementation Steps
- Include the Module: Add include Enumerable within your class definition.
- Define #each: Implement an each method that yields each element of your collection to a provided block.
- Return an Enumerator (Optional but Recommended): It is best practice to return an Enumerator if no block is given to the each method. This allows for external iteration and chaining.
- Implement <=> (For Sorting): If you plan to use methods like sort, min, or max, the objects within your collection must implement the spaceship operator (<=>) to define their comparison logic.

## Example Implementation:
```
class MyCollection
  include Enumerable

  def initialize(items)
    @items = items
  end

  # Mandatory method for Enumerable
  def each(&block)
    return to_enum(:each) unless block_given?
    @items.each(&block)
  end
end
```

## Usage
collection = MyCollection.new([1, 2, 3])
collection.map { |i| i * 2 } # => [2, 4, 6]
collection.find { |i| i > 1 } # => 2

## Benefits of Implementation
Once these steps are completed, your class automatically gains access to over 50 powerful utility methods, including:

Transformation: map, collect, reduce.
Filtering: select, reject, find, any?, all?.
Sorting: sort, sort_by.Search: include?, grep

### More on enumerable with Linked List implementation:
https://blog.appsignal.com/2018/05/29/ruby-magic-enumerable-and-enumerator.html
