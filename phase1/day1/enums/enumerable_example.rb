class MyCollection
  include Enumerable

  def initialize(items)
    @items = items
  end

  def each(&block)
    return to_enum(:each) unless block_given?
    @items.each(&block)
  end
end

collection = MyCollection.new([1,2,3])
p collection.each {|item| item * 2}

p collection.map {|c| c*2}

collection2 = MyCollection.new({a: 'text', b: 123})
collection2.each {|k,v| puts "key: #{k} and val: #{v}"}
