class MyClass
    def self.print_hello
        puts "singleton/class hello"
    end

    def print_hello
        puts "instance hello"
    end
end

MyClass.print_hello # => singleton/class hello
MyClass.new.print_hello # => instance hello

## It is similar to 

def MyClass.some_method
    puts "hello from singleton method on Myclass"
end

MyClass.some_method # => hello from singleton method on Myclass

## or as we saw earlier
class << MyClass
    def another_singletone_method
        puts "hello again"
    end
end

MyClass.another_singletone_method # => hello again

