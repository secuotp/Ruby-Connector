class XMLTag
  def initialize
    @tagName = nil
    @value = nil
    @childNode = Array.new
    @pointer = 0
  end
  
  def XMLTag(tagName, value)
    @tagName = tagName
    @value = value
  end
  
  def XMLTag(tagName, childNode)
    @tagName = tagName
    @childNode = childNode
  end
  
  def getTagName
    return @tagName
  end
  
  def setTagName(tagName)
    @tagName = tagName
  end
  
  def getValue
    return @value
  end
  
  def setValue(value)
    @value = value
  end
  
  def getChildNode
    return @childNode
  end
  
  def setChildNode(childNode)
    @childNode = childNode
  end
  
  def haveChildNode
    return @childNode != nil
  end
  
  def getChildTag(item)
    @childNode[item]
  end
  
  def addChildTag(tagName, value)
    @childNode.push(XMLTag(tagName, value))
  end
  
  def addChildTag(tagName)
    @childNode.push(XMLTag(tagName, Array.new));
    tag = @childNode[@childNode.count - 1];
    return tag;
  end
end