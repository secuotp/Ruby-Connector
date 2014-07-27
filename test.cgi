class Test
  def initialize (text = "Hello World")
    @text = text
  end
  def show
    puts "text = #{@text}"
  end
end

t = Test.new("YOLO")
t.show
