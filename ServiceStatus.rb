class ServiceStatus
  def initialize
    @statusId = 0
    @statusText = nil
  end
  
  def ServiceStatus
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
end