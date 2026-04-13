require_relative 'method_lookup_ancestors'
# same as =>
# require File.join(File.expand_path('..', __FILE__), 'method_lookup_ancestors')

class Human < Creature
  prepend Three
  extend Two
  include One

  def another
    puts "Instance method"
  end

  def self.another
    puts "From Human class singleton"
  end

  def method_missing(method, *args)
    if method == :my_method
      puts "From my_method"
    else
      super
    end
  end
end

# method lookup-chain
# from Human singleton method or class method
# Then from the extended module Two
Human.another


# method look-up chain
# From manu object
# From three module (prepend)
# From Instance method
# From one module
# From creature class
manu = Human.new
def manu.another
  puts "From manu object"
end

manu.another

manu.my_method
# manu.another_method # `method_missing': undefined method `another_method' for #<Human:0x0000000aa8f38038> (NoMethodError)

puts Human.ancestors
# Three
# Human
# One
# Creature
# Object
# Kernel
# BasicObject
