require_relative 'ServiceCode.rb'
require_relative 'XMLTag.rb'

class XMLRequest
  def initialize
    @domainName = nil
    @id = nil
    @serialNumber = nil
    @paramTag = nil
    @pointer = 0
  end
  
  def XMLRequest
    @code = ServiceCode.new
    @domainName = ""
    @serialNumber = ""
    @paramTag = Array.new {Hash.new}
  end
  
  def getParamTag
    return @paramTag
  end
  
  def setSid(id)
    @id = id
  end
  
  def getSid
    return @id
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
  
  def addChildValue(tagName, value)
    tag = XMLTag.new
    tag.setTagName(tagname)
    tag.setChildNode(value)
    @paramTag.push(tag)
  end
  
  def addChildTag(tagName)
    tag = XMLTag.new
    tag.setTagName(tagname)
    tag.setChildNode(Array.new {Hash.new})
    @paramTag.push(tag)
    return @paramTag[@paramTag.count - 1]
  end
  
  def setParameter(xmlTag)
    if xmlTag.haveChildNode
      p = 0
      while p < xmlTag.getChildNode.count
        
      end
    end
    return nil
  end
  
  def toString
    xml = "<?xml version=\"1.0\"?>
              <secuotp>
                <service sid=\"#{@id}\"> #{@code.getServiceName(@id)} </service>
                <authentication>
                  <domain> #{@domainName} </domain>
                  <serial> #{@serialNumber} </serial>
                </authentication>
                <parameter>"
    param = nil
    
       
    @end = "</parameter>
          </secuotp>"
    @xmldoc = @xml + @end
  end
end