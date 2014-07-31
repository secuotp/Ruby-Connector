class XMLReqRes
  def initialize
    @sid = nil
    @serviceName = nil
  end
  
  def getSid
    return @sid
  end

  def setSid(sid)
    @sid = sid
  end

  def getServiceName
    return @serviceName
  end

  def setServiceName(serviceName)
    @serviceName = serviceName
  end
end