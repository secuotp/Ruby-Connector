require_relative "XMLRequest.rb"
require_relative "XMLResponse.rb"
require_relative "XMLParameter.rb"
require 'net/http'
require 'net/https'

req = XMLRequest.new
req.setSid("M-01")
#req.setSid("U-02")
#req.setSid("U-01")
req.setDomainName("https://hoax.co.jp")
req.setSerialNumber("34BWS-GH56N-JQ45M-PP2HG")
req.setParamTag(Array.new {Hash.new})
req.addChildValue("username", "WTF")
req.addChildValue("email", "admin@wtf.com");
req.addChildValue("fname", "TheHeck");
req.addChildValue("lname", "NoYOLO");
req.addChildValue("phone", "1819998233");

#req.addChildValue("username", "Dafuq")
#req.addChildValue("type", "full");
#changeTag = req.addChildTag("change")
#changeTag.setChildNode(Array.new {Hash.new})
#changeTag.addChildValue("param", "email")
#changeTag.addChildValue("value", "yolo@xyz.com")

service = ServiceCode.new
xml = req.toString
dataSize = xml.bytesize.to_s
uri = URI.parse(service.getServiceUri("M-01"))
#uri = URI.parse(service.getServiceUri("U-02"))
#uri = URI.parse(service.getServiceUri("U-01"))
#request = Net::HTTP::Put.new(uri.path)
request = Net::HTTP::Post.new(uri.path)
request.content_length = dataSize
request.content_type = "application/xml"
request.body = "request="+xml
http = Net::HTTP.new(uri.host, 443)
http.use_ssl = true
http.ssl_version = :TLSv1
http.verify_mode = OpenSSL::SSL::VERIFY_NONE
response = http.start {http.request(request)}

res = XMLResponse.new
res.XMLResponse(response.body)
param = res.getParameter

puts response.body

#while param.hasNext
#  a = param.pop
#  puts "#{a[0]}\t#{a[1]}"
#end
