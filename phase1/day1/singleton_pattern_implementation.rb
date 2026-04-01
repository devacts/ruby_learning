require 'singleton'

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

NotSingleton.new # This will be printed many times
NotSingleton.new # This will be printed many times
NotSingleton.new # This will be printed many times

MySingleton.instance # This will be printed once
MySingleton.instance
MySingleton.instance


## Calling MySingleton.new will result in error:
## private method `new' called for MySingleton:Class (NoMethodError)
## Uncomment below and run to see error
# MySingleton.new
