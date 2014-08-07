require_relative "XMLRequest.rb"
require_relative "XMLResponse.rb"
require_relative "XMLParameter.rb"

req = XMLRequest.new
req.setSid("U-02")
req.setDomainName("https://hoax.co.jp")
req.setSerialNumber("34BWS-GH56N-JQ45M-PP2HG")
req.setParamTag(Array.new {Hash.new})
req.addChildValue("username", "Dafuq")
changeTag = req.addChildTag("change")
changeTag.setChildNode(Array.new {Hash.new})
changeTag.addChildValue("param", "email")
changeTag.addChildValue("value", "lolz@xyz.com")

service = ServiceCode.new
uri = service.getServiceUri("U-02");
puts req.toString