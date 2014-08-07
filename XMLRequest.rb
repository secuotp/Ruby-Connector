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
    tag.setTagName(tagName)
    tag.setValue(value)
    @paramTag.push(tag)
  end
  
  def addChildTag(tagName)
    tag = XMLTag.new
    tag.setTagName(tagName)
    tag.setChildNode(Array.new {Hash.new})
    @paramTag.push(tag)
    return @paramTag[@paramTag.size - 1]
  end
  
  def setParameter(xmlTag)
    puts xmlTag.haveChildNode
    if xmlTag.haveChildNode
      item = xmlTag.getChildNode
      subTag1 = "<#{xmlTag.getTagName}>"
      values = ""
      p = 0
      while p < xmlTag.getChildNode.count
        begin
          item2 = item[p]
          p += 1
          values = values + setParameter(item2)
        rescue
          puts "Error occured - Index out of bound."
          break
        end
      end
      subTag2 = "\n</#{xmlTag.getTagName}>"
      return subTag1 + values + subTag2
    else
      return "\n<#{xmlTag.getTagName}>#{xmlTag.getValue}</#{xmlTag.getTagName}>"
    end
  end
  
  def toString
    code = ServiceCode.new
    xml = "<?xml version=\"1.0\"?>
              <secuotp>
                <service sid=\"#{@id}\"> #{code.getServiceName(@id)} </service>
                <authentication>
                  <domain> #{@domainName} </domain>
                  <serial> #{@serialNumber} </serial>
                </authentication>
                <parameter>"
    param = ""
    @pointer = 0
    while @pointer < @paramTag.size
      begin
        tag = @paramTag[@pointer]
        param = param + "\n" + setParameter(tag)
        @pointer += 1
      rescue
        puts "Error occured - Index out of bound."
        break
      end
    end
       
    xmlend = "\n</parameter>
          </secuotp>"
    @xmldoc = xml + param + xmlend
    return @xmldoc
  end
end