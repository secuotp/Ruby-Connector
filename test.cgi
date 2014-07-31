class Test
  def initialize (text = "Hello World")
    @text = text
  end
  def show
    puts "text = #{@text}"
  end
end

a = 10
b = 1000
puts a
while a < b
  a = a + 10
  puts a
  a+1
end

t = Test.new("YOLO")
t.show

puts Time.now.to_i

#value = XMLParameter.new
#value.add("Serial",1234567)
#puts value.pop
#value.add("Domain","Polwath.com")
#puts value.pop
#value.add("Name","Polwath")
#puts value.pop
#value.add("Surname","Rojchalermritra")
#puts value.pop
#value.add("username","polwath2534")
#puts value.pop