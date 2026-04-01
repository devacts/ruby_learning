# The Eigenclass

When we create an instance of a class, it creates another class of that object automatically which is a hidden class
It is essentially a copy of the original class from which it was instantiated.

This eigenclass is used to define the singleton_methods for that object/instance created.
The singleton methods thus created on an instance do not impact other instances of the orignal class.

## Eigenclass is a Singleton Class
This eigenclass is also called the singleton class because it exists only for a particular of object of a class from which the object was created.
e.g.
```
# This class is NOT a singleton
class ExampleObject
  def print_hello
    puts 'Hello'
  end
end

object1 = ExampleObject.new
object2 = ExampleObject.new

object1.print_hello # => 'Hello'
object2.print_hello # => 'Hello'

def object2.print_hello
  puts 'Bonjour'
end

object1.print_hello # => 'Hello'
object2.print_hello # => 'Bonjour'
```

Another way to define a singleton_method is by using << notation as seen above.
```
object2 = ExampleObject.new

class << object2
  def print_hello
    puts 'Aloha'
  end
end
```

It is another way of opening/accessing the eigenclass of object2
