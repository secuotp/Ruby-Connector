require_relative "XMLRequest.rb"
require_relative "ServiceCode.rb"
require 'net/http'
require 'net/https'

class Service
  def httpPost(sCode, req)
    service = ServiceCode.new
    xml = req.toString
    dataSize = xml.bytesize.to_s
    uri = URI.parse(service.getServiceUri(sCode))
    request = Net::HTTP::Post.new(uri.path)
    
    request.content_length = dataSize
    request.content_type = "application/xml"
    request.body = "request="+xml
    http = Net::HTTP.new(uri.host, 443)
    http.use_ssl = true
    http.ssl_version = :TLSv1
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    http.ca_file = "C:\\RailSSL\\cacert.pem"
    response = http.start {http.request(request)}
    
    return response
  end
  
  def httpPut(sCode, req)
    service = ServiceCode.new
    xml = req.toString
    dataSize = xml.bytesize.to_s
    uri = URI.parse(service.getServiceUri(sCode))
    request = Net::HTTP::Put.new(uri.path)
    
    request.content_length = dataSize
    request.content_type = "application/xml"
    request.body = "request="+xml
    http = Net::HTTP.new(uri.host, 443)
    http.use_ssl = true
    http.ssl_version = :TLSv1
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    http.ca_file = "C:\\RailSSL\\cacert.pem"
    response = http.start {http.request(request)}
    
    return response
  end
end