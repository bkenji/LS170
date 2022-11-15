
  class << Object
    puts "This is self: #{self}"
    def to_s
     self
    end
  end


puts Object

p Object.to_s