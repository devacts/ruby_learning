# Classes are Objects in Ruby (Everything is object in Ruby, almost!)

## Axioms
- Classes are Objects in Ruby
- Class of any class in Ruby is Class.

Class of any class is always, well, Class
e.g.
```
# We can create ExampleObject like this :
class ExampleObject
end

# Or like this :
ExampleObject = Class.new

ExampleObject.new.class # => ExampleObject
ExampleObject.class # => Class
Class.class # => Class
ExampleObject.class.class.class.class # => Class
```
So ExampleObject which is a class is an Object too
whose class is Class i.e. it is an instance of class Class

As all objects have an eigneclass, ExampleObject being an object should have an eignenclass too!

If an Eigenclass is like a copy of the class of the instance of an object,
then a Eigenclass of a class say ExampleObject should also be like a copy of Class
### Instance of class ExampleObject
`ExampleObject.new` # => Eigenclass : a copy of ExampleObject

###  Instance of class Class
`ExampleObject` # => Eigenclass : a copy of Class

## Accessing Eigenclass of ExampleObject

ExampleObject = Class.new

def ExampleObject.hello
    puts "I am singleton method on Object ExampleObject"
end

e.g. we want to access the Eigenclass of the ExampleObject class.

We can do it in these ways:
```
class ExampleObject
  # Either inside the definition of the class
  class << self
    def class_print_hello
      puts 'Hello'
    end
  end
end

ExampleObject.class_print_hello # => 'Hello'

# or outside

class << ExampleObject
  def class_print_hello
    puts 'Sayonara'
  end
end

ExampleObject.class_print_hello # => 'Sayonara'
```
class_print_hello is an singleton method on Class ExampleObject
It is done by accessing the eigenclass of ExampleObject

