class User
  def initialize
    @username = ""
    @email = ""
    @firstName = ""
    @lastName = ""
    @phone = ""
    @serialNumber = ""
    @removalCode = ""
  end
  
  def setUsername(username)
    @username = username
  end
  
  def getUsername
    return @username
  end
  
  def setEmail(email)
    @email = email
  end
  
  def getEmail
    return @email
  end
  
  def setFirstName(firstName)
    @firstName = firstName
  end
  
  def getFirstName
    return @firstName
  end
  
  def setLastName(lastName)
    @lastName = lastName
  end
  
  def getLastName
    return @lastName
  end

  def setPhone(phone)
    @phone = phone
  end
  
  def getPhone
    return @phone
  end
    
  def setSerialNumber(serialNumber)
    @serialNumber = serialNumber
  end
  
  def getSerialNumber
    return @serialNumber
  end
  
  def setRemovalCode(removalCode)
    @removalCode = removalCode
  end
  
  def getRemovalCode
    return @removalCode
  end
end