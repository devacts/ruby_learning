# Class methods are basically methods on the Eigenclass of the class
In other words class methods defined using self keyword are singleton methods implemented on the Eigenclass of the class
```
class MyModel
    def self.print_hello
     puts "hello"
    end
end

Mymodel.print_hello # => hello
```

It is same as opening the eigenclass with << notation of self of object

self.print_hello is also called a Class method.
To differenciate class method with an Instance method. See the following:

```
class MyModel
  # Class Method
  def self.print_hello
    puts 'Hello'
  end

  # Instance Method
  def print_bonjour
    puts 'Bonjour'
  end
end

MyModel.print_hello # => 'Hello'
MyModel.new.print_hello # => ERROR
MyModel.print_bonjour # => ERROR
MyModel.new.print_bonjour # => 'Bonjour'
```

- Singleton methods of a class are methods on the instance of a class.
- Class methods of a class are actually just an Instance method of the Eigenclass of your class. (Same thing)
