# Class of any class is always, well, Class
class ExampleClass
end

# same as:
ExampleClass = Class.new
# We will see warnings:
# class_is_object.rb:5: warning: already initialized constant ExamplClass
# class_is_object.rb:1: warning: previous definition of ExamplClass was here

puts ExampleClass.new.class # ExampleClass
puts ExampleClass.class # Class

puts Class.class # Class
puts ExampleClass.class.class.class.class # Class

puts ExampleClass.new.singleton_class # #<Class:ExampleClass:[somehexvalue]>>
puts ExampleClass.singleton_class # #<Class:ExampleClass>

# Accessing Eigenclass of ExampleObject

## 1 defining individually
ExampleObject = Class.new

def ExampleObject.hello
    puts "I am singleton method on Object ExampleObject"
end

ExampleObject.hello

## 2 or this way outside the definition of class

class << ExampleObject
    def singleton_hello
        puts "I am also method on Object ExampleObject"
    end
end

ExampleObject.singleton_hello

## 3 or also like this inside the definition of class

class ExampleObject
    class << self
        def singleton_hello
            puts "I am also method on Object ExampleObject"
        end
    end
end

ExampleObject.singleton_hello
