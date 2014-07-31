require_relative 'XMLResponse.rb'
require_relative 'XMLParser.rb'

class XMLResponse
  def initialize
    @status = 0
    @message = nil
    @parameter = nil
  end
  
  def XMLResponse(xml)
    @parameter = XMLParameter.new
    parse = XMLParser.new
    parse.XMLParser(xml)
    status = Integer()
  end
end