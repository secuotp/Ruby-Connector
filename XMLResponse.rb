require_relative 'XMLResponse.rb'
require_relative 'XMLParameter.rb'
require "rexml/document"

class XMLResponse
  def initialize
    @status = 0
    @message = nil
    @parameter = nil
  end
  
  def getStatus
    return @status
  end
  
  def getMessage
    return @message
  end
  
  def getParameter
    return @parameter
  end
  
  def setStatus(status)
    @status = status
  end
  
  def setMessage(message)
    @message = message
  end
  def setParameter(parameter)
    @parameter = parameter
  end
  
  def XMLResponse(xml)
    @parameter = XMLParameter.new
    @xml = REXML::Document.new(xml)
    @status = @xml.elements["secuotp/status/"]
    @message = @xml.elements["secuotp/message/"]
    if @xml.elements["secuotp/response/"] != nil
      @xml.elements.each("secuotp/response/*") do |sub|
        @parameter.add(sub.name,sub.text)
      end
    end
  end
end