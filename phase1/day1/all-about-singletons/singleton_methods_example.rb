class TestClass
    def hello(x='say')
        puts(x + " hello")
    end

    def say_hello
        hello()
    end
end

puts "Class of TestClass is: #{TestClass.class}"
puts "Class of an instance of TestClass is: #{TestClass.new.class}"
tc = TestClass.new
puts "Class of tc instance is: #{tc.class}"

puts "\n\n\n"
puts "calling class method hello on Testclass instance tc"
tc.hello

puts "defining singleton method hello on tc"
# Singleton method begin
def tc.hello
    puts("singleton hello")
end
# Singleton method end

puts "calling hello and say_hello on tc now after adding singleton method hello"
tc.hello
tc.say_hello
puts tc.class
puts tc.singleton_class

## Singleton methods begin by opening eigneclass of tc object(instance of TestClass)
## More than one singleton methods can be defined this way

puts "adding more singleton methods to instance tc using << notation"
class << tc
    def say_what_bch?
        "say_what?"
    end

    def hush!
        "ssshh..."
    end
end
## Singleton methods end

puts "calling singleton methods say_what_bch? and hush! on instance tc"
puts tc.say_what_bch?
puts tc.hush!


puts "Instantiating another test class with no singleton_methods"
another_tc = TestClass.new

puts "calling hello and say_hello on instance another_tc"
another_tc.hello
another_tc.say_hello

puts "calling singleton method say_what_bch? on another_tc which is defined on tc instance"
puts "will result in error: undefined method `say_what_bch?' for #<TestClass:<some hex val>> (NoMethodError)"
puts "you can test by uncommeting the say_what_bch? call on another_tc instance"
# another_tc.say_what_bch? # uncomment to see the error


