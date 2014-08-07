class XMLTag
  def initialize
    @tagName = nil
    @value = nil
    @childNode = nil
    @pointer = 0
  end
  
  def XMLTag
    @tagName = tagName
    @value = value
  end
  
  def XMLTag
    @tagName = tagName
    @childNode = Array.new {Hash.new}
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
    return !@childNode.nil?
  end
  
  def getChildTag(item)
    @childNode[item]
  end
  
  def addChildValue(tagName, value)
    tag = XMLTag.new
    tag.setTagName(tagName)
    tag.setValue(value)
    @childNode.push(tag)
  end
  
  def addChildTag(tagName)
    tag = XMLTag.new
    tag.XMLTag(tagName, Array.new {Hash.new})
    @childNode.push(tag)
    return @childNode[@childNode.count - 1]
  end
end