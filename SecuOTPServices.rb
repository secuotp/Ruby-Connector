require_relative "XMLRequest.rb"
require_relative "XMLResponse.rb"
require_relative "Service.rb"
require_relative "ServiceStatus.rb"

class SecuOTPService
  def initialize
    @domain = nil
    @serialNumber = nil
  end
  
  def SecuOTPService(domain, serialNumber)
    @domain = domain
    @serialNumber = serialNumber
  end
  
  def setDomain(domain)
    @domain = domain
  end
  
  def getDomain
    return @domain
  end
  
  def setSerialNumber(serialNumber)
    @serialNumber = serialNumber
  end
  
  def getSerialNumber
    return @serialNumber
  end
  
  def registerEndUser(username, email, firstName, lastName, phone)
    req = XMLRequest.new
    req.setSid("M-01")
    req.setDomainName(@domain)
    req.setSerialNumber(@serialNumber)
    req.setParamTag(Array.new {Hash.new})
    req.addChildValue("username", username)
    req.addChildValue("email", email)
    req.addChildValue("fname", firstName)
    req.addChildValue("lname", lastName)
    req.addChildValue("phone", phone)
    
    ser = Service.new
    res = ser.httpPost("M-01", req)
    
    result = XMLResponse.new
    result.XMLResponse(res.body)
    
    if(result != nil)
      status = ServiceStatus.new
      status.setStatusId(result.getStatus)
      status.setStatusText(result.getMessage)
      return status
    else
      return nil
    end
  end
  
  def disableEndUser(username, removalCode)
    req = XMLRequest.new
    req.setSid("M-02")
    req.setDomainName(@domain)
    req.setSerialNumber(@serialNumber)
    req.setParamTag(Array.new {Hash.new})
    req.addChildValue("username", username)
    req.addChildValue("code", removalCode)
    ser = Service.new
    res = ser.httpPost("M-02", req)
    
    result = XMLResponse.new
    result.XMLResponse(res.body)
    
    if(result != nil)
      param = XMLParameter.new
      
      status = ServiceStatus.new
      status.setStatusId(result.getStatus)
      status.setStatusText(result.getMessage)
      return status
    else
      return nil
    end
  end
  
  def generateOneTimePassword(username)
    req = XMLRequest.new
    req.setSid("G-01")
    req.setDomainName(@domain)
    req.setSerialNumber(@serialNumber)
    req.setParamTag(Array.new {Hash.new})
    req.addChildValue("username", username)
    
    ser = Service.new
    res = ser.httpPost("G-01", req)
    
    result = XMLResponse.new
    result.XMLResponse(res.body)
    
    if(result != nil)
      status = ServiceStatus.new
      status.setStatusId(result.getStatus)
      status.setStatusText(result.getMessage)
      return status
    else
      return nil
    end
  end
  
  def authenticateOneTimePassword(username, otp)
    req = XMLRequest.new
    req.setSid("A-01")
    req.setDomainName(@domain)
    req.setSerialNumber(@serialNumber)
    req.setParamTag(Array.new {Hash.new})
    req.addChildValue("username", username)
    req.addChildValue("password", otp)
    ser = Service.new
    res = ser.httpPost("A-01", req)
    
    result = XMLResponse.new
    result.XMLResponse(res.body)
    
    if(result != nil)
      status = ServiceStatus.new
      status.setStatusId(result.getStatus)
      status.setStatusText(result.getMessage)
      return status
    else
      return nil
    end
  end
end