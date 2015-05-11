require_relative "XMLRequest.rb"
require_relative "OTPMigration.rb"
require_relative "XMLResponse.rb"
require_relative "Service.rb"
require_relative "ServiceStatus.rb"
require_relative "User.rb"

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
    
    if result != nil
      status = ServiceStatus.new
      status.ServiceStatus(result.getStatus, result.getMessage)
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
    
    if result != nil
      param = XMLParameter.new
      
      status = ServiceStatus.new
      status.ServiceStatus(result.getStatus, result.getMessage)
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
    
    if result != nil 
      status = ServiceStatus.new
      status.ServiceStatus(result.getStatus, result.getMessage)
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
    
    if result != nil
      status = ServiceStatus.new
      status.ServiceStatus(result.getStatus, result.getMessage)
      return status
    else
      return nil
    end
  end
  
  def migrateOTP(username)
    req = XMLRequest.new
    req.setSid("O-01")
    req.setDomainName(@domain)
    req.setSerialNumber(@serialNumber)
    req.setParamTag(Array.new {Hash.new})
    req.addChildValue("username", username)
      
    ser = Service.new
    res = ser.httpPost("O-01", req)
    
    result = XMLResponse.new
    result.XMLResponse(res.body)
    
    if result != nil
      if result.getParameter != nil
        migrate = result.getParameter
        otpmig = OTPMigration.new
        otpmig.setUsername(migrate.getValue("username"))
        otpmig.setMigration(migrate.getValue("migration-code"))

        status = ServiceStatus.new
        status.ServiceStatus(result.getStatus, result.getMessage)
        status.setData(otpmig)
        return status 
      else
        status = ServiceStatus.new
        status.ServiceStatus(result.getStatus, result.getMessage)
        return status
      end
    else
      return nil
    end
  end
  
  def getUserData(username, type)
    req = XMLRequest.new
    req.setSid("U-01")
    req.setDomainName(@domain)
    req.setSerialNumber(@serialNumber)
    req.setParamTag(Array.new {Hash.new})
    req.addChildValue("username", username)
    
    @type = nil
    if type === 0
      @type = "default"
    elsif type === 1
      @type = "full"
    end
    
    req.addChildValue("type", @type)
    
    ser = Service.new
    res = ser.httpPost("U-01", req)
    
    result = XMLResponse.new
    result.XMLResponse(res.body)
    
    if result != nil 
      if result.getParameter != nil
        data = result.getParameter
        user = User.new
        user.setUsername(data.getValue("username"))
        user.setEmail(data.getValue("email"))
        user.setFirstName(data.getValue("fname"))
        user.setLastName(data.getValue("lname"))
        user.setPhone(data.getValue("phone"))
        
        if type == 1
           user.setSerialNumber(data.getValue("serial"))
           user.setRemovalCode(data.getValue("removal"))
        end
        
        status = ServiceStatus.new
        status.ServiceStatus(result.getStatus, result.getMessage)
        status.setData(user)
        return status
      else
        status = ServiceStatus.new
        status.ServiceStatus(result.getStatus, result.getMessage)
        return status
      end
    else
      return nil
    end
  end
end