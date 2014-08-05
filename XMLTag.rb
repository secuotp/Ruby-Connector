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
    return @childNode.empty?
  end
  
  def getChildTag(item)
    @childNode[item]
  end
  
  def addChildTag1(tagName, value)
    tag = XMLTag.new
    tag.XMLTag(tagName, value)
    @childNode.push(tag)
  end
  
  def addChildTag2(tagName)
    tag = XMLTag.new
    tag.XMLTag(tagName, Array.new {Hash.new})
    @childNode.push(tag)
    return @childNode[@childNode.count - 1]
  end
end