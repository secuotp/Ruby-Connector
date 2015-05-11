class ServiceStatus
  def initialize
    @statusId = 0
    @statusText = nil
    @data = nil
  end
  
  def ServiceStatus(statusId, statusText)
    @statusId = statusId
    @statusText = statusText
  end
  
  def setStatusId(statusId)
    @statusId = statusId
  end
  
  def getStatusId
    return @statusId
  end
  
  def setStatusText(statusText)
    @statusText = statusText
  end
  
  def getStatusText
    return @statusText
  end
  
  def setData(data)
    @data = data
  end
  
  def getData
    return @data
  end
end