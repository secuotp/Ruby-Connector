require_relative 'XMLReqRes.rb'
require_relative 'XMLTag.rb'

class XMLRequest < XMLReqRes
  def initialize
    @domainName = nil
    @serialNumber = nil
    @paramTag = nil
    @pointer = 0
  end
  
  def XMLRequest
    this = XMLReqRes.new
    this.setSid("")
    @domainName = ""
    @serialNumber = ""
    @paramTag = Array.new
  end
  
  def getParamTag
    return @paramTag
  end
  
  def setParamTag(paramTag)
    @paramTag = paramTag
  end
  
  def getDomainName
    return @domainName
  end
  
  def setDomainName(domainName)
    @domainName = domainName
  end

  def getSerialNumber
    return @serialNumber
  end
      
  def setSerialNumber(serialNumber)
    @serialNumber = serialNumber
  end
  
  def getChildTag(item)
    tag = @paramTag[item]
    return tag
  end
  
  def addChildTag(tagName, value)
    tag = XMLTag.new
    paramTag.push(tag.XMLTag(tagname, value))
  end
  
  def addChildTag(tagName)
    tag = XMLTag.new
    paramTag.push(tag.XMLTag(tagname, Array.new))
    tag = @paramTag[@paramTag.count - 1]
    return tag
  end
end