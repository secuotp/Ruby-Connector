class XMLParameter
  def initialize
    @keylist = Array.new {Hash.new}
    @valuelist = Array.new {Hash.new}
    @pointer = 0
  end
  
  def add(key, value)
    @keylist.push(key)
    @valuelist.push(value)
  end
  
  def pop
    begin
      valueString = Array.new
      valueString[0] = @keylist[@pointer]
      valueString[1] = @valuelist[@pointer]
      @pointer += 1
      return valueString
    rescue
      puts "Index out of bound."
    end
    return nil
  end
  
  def peek
    begin
      valueString = Array.new
      valueString[0] = @keylist[@pointer]
      valueString[1] = @valuelist[@pointer]
      return valueString
    rescue
      puts "Index out of bound."
    end
    return nil
  end
  
  def hasNext
    return @pointer < @keylist.count
  end
  
  def first
    @pointer = 0
  end
  
  def last
    @pointer = keylist.count
  end
  
  def getValue(key)
    p = 0
    while p < @keylist.size do
      if @keylist[p] == key
        puts @valuelist[p];
        break
      else
        p += 1
      end
    end
    return nil
  end
  
  def clear
    @keylist = Array.new
    @valuelist = Array.new
    first
    return first
  end
end