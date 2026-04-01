# Axioms
- Classes are what we use to define our objects
- Instances of classes are the objects created by our classes

## The Singleton pattern
The Singleton pattern is simply an object-oriented programming pattern where you make sure to have 1 and only 1 instance of some class.

In ruby we can implement Singleton pattern by including singleton module in class defintion
e.g.
```
require singleton

class NotSingleton
  # 'initialize' is called everytime an instance is created
  def initialize
    puts 'This will be printed many times'
  end
end

class MySingleton
  include Singleton

  # 'initialize' is called everytime an instance is created
  def initialize
    puts 'This will be printed once'
  end
end

NotSingleton.new # => 'This will be printed many times' 
NotSingleton.new # => 'This will be printed many times' 
NotSingleton.new # => 'This will be printed many times' 

MySingleton.instance # => 'This will be printed once'
MySingleton.instance # Nothing is printed
MySingleton.instance # Nothing is printed
```
singleton module hides new method, hence we cannot call MySingleton.new
Instead, it gives us an instance method that will always return the same unique instance of MySingleton class.

