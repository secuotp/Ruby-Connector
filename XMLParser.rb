require 'rexml/document'

class XMLParser
  def initialize
    @doc = nil
    @list = nil
    @e = nil
  end
  
  def XMLParser(xml)
    @doc = REXML::Document.new(xml)
  end
  
  def getDataFromTag(position, tagName, numberItem)
    @list = Array.new
    @doc.elements.each(position) do |element|
      @list.push(element)
    end
    if @list.count > 0
      return @list[numberItem]
    else
      return nil
    end
  end
  
  def getChildData(nList, numberItem)
    data = Array.new[2]
    n = nList[0]
    data[0] = ""
    data[1] = ""
    return data
  end
  
  def getNodeFromTag(tagName)
    return @doc.elements[tagName]
  end
  
  def getAttributeFromTag(tagName, attributeName, numberItem)
    @list = Array.new
    @doc.elements.each(tagName) do |element|
      @list.push(element.attributes[attributeName])
    end
    if @list.count > 0
      @e = @list[numberItem]
      return @e.attributes[attributeName]
    else
      return nil
    end
  end
  
  def getChildItem(tagName, numberItem)
    @list = Array.new
    @doc.elements.each(tagName) do |element|
      @list.push(element)
    end
    @e = @list[numberItem]
    if @e == nil
      return 0
    end
    return @e[0].count
  end
    
  def getNumberItem(tagName)
    @list = Array.new
    @doc.elements.each(position) do |element|
      @list.push(element)
    end
    return @list.count
  end
end

test = XMLParser.new
test.XMLParser("<test><value>1234567</value></test>")
puts test.getDataFromTag("test/*", "value",0)
