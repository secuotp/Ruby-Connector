require 'nokogiri'
require 'open-uri'

class XMLParser
  def initialize
    @doc = nil
    @list = nil
    @e = nil
  end
  
  def XMLParser(xml)
    @doc = Nokogiri::XML(xml)
  end
  
  def getDataFromTag(tagName, numberItem)
    
  end
end