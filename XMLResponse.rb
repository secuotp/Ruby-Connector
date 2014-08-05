require_relative 'XMLResponse.rb'

class XMLResponse
  def initialize
    @status = 0
    @message = nil
    @parameter = nil
  end
  
  def XMLResponse(xml)
    @parameter = XMLParameter.new
    status = Integer()
  end
end