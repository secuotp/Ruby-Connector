class OTPMigration
  def initialize
    @username = nil
    @migration = nil
  end
  
  def OTPMigration(username, migration)
    @username = username
    @migration = migration
  end
  
  def setUsername(username)
    @username = username
  end
  
  def getUsername
    return @username
  end
  
  def setMigration(migration)
    @migration = migration
  end
  
  def getMigration
    return @migration
  end
end