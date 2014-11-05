class ServiceCode
  def initialize
    @REGISTER_END_USER = "M-01"
    @REGISTER_END_USER_NAME = "Register End-User"
    @REGISTER_END_USER_URI = "https://secuotp.sit.kmutt.ac.th/SecuOTP-Service/manage/register/end-user"

    @DISABLE_END_USER = "M-02"
    @DISABLE_END_USER_NAME = "Disable End-User"
    @DISABLE_END_USER_URI = "https://secuotp.sit.kmutt.ac.th/SecuOTP-Service/manage/disable/end-user"

    @GENERATE_ONE_TIME_PASSWORD = "G-01"
    @GENERATE_ONE_TIME_PASSWORD_NAME = "Generate One-Time Password"
    @GENERATE_ONE_TIME_PASSWORD_URI = "https://secuotp.sit.kmutt.ac.th/SecuOTP-Service/otp/generate"

    @AUTHENTICATE_ONE_TIME_PASSWORD = "A-01"
    @AUTHENTICATE_ONE_TIME_PASSWORD_NAME = "Authenticate One-Time Password"
    @AUTHENTICATE_ONE_TIME_PASSWORD_URI = "https://secuotp.sit.kmutt.ac.th/SecuOTP-Service/otp/authenticate"

    @MIGRATE_ONE_TIME_PASSWORD_CHANNEL = "O-01"
    @MIGRATE_ONE_TIME_PASSWORD_CHANNEL_NAME = "Migrate One-Time Password Channel"
    @MIGRATE_ONE_TIME_PASSWORD_CHANNEL_URI = "https://secuotp.sit.kmutt.ac.th/SecuOTP-Service/otp/migrate"

    @GET_END_USER_DATA = "U-01"
    @GET_END_USER_DATA_NAME = "Get End-User Data"
    @GET_END_USER_DATA_URI = "https://secuotp.sit.kmutt.ac.th/SecuOTP-Service/user/end-user"

    @PUT_END_USER_DATA = "U-02"
    @PUT_END_USER_DATA_NAME = "Set End-User Data"
    @PUT_END_USER_DATA_URI = "https://secuotp.sit.kmutt.ac.th/SecuOTP-Service/user/end-user"
  end

  def getServiceName(service)
    if service == @REGISTER_END_USER
    return @REGISTER_END_USER_NAME
    elsif service == @DISABLE_END_USER
    return @DISABLE_END_USER_NAME
    elsif service == @GENERATE_ONE_TIME_PASSWORD
    return @GENERATE_ONE_TIME_PASSWORD_NAME
    elsif service == @AUTHENTICATE_ONE_TIME_PASSWORD
    return @AUTHENTICATE_ONE_TIME_PASSWORD_NAME
    elsif service == @MIGRATE_ONE_TIME_PASSWORD_CHANNEL
    return @MIGRATE_ONE_TIME_PASSWORD_CHANNEL_NAME
    elsif service == @TIME_SYNC
    return @TIME_SYNC_NAME
    elsif service == @GET_END_USER_DATA
    return @GET_END_USER_DATA_NAME
    elsif service == @PUT_END_USER_DATA
    return @PUT_END_USER_DATA_NAME
    else
      return nil
    end
  end

  def getServiceUri(service)
    if service == @REGISTER_END_USER
    return @REGISTER_END_USER_URI
    elsif service == @DISABLE_END_USER
    return @DISABLE_END_USER_URI
    elsif service == @GENERATE_ONE_TIME_PASSWORD
    return @GENERATE_ONE_TIME_PASSWORD_URI
    elsif service == @AUTHENTICATE_ONE_TIME_PASSWORD
    return @AUTHENTICATE_ONE_TIME_PASSWORD_URI
    elsif service == @MIGRATE_ONE_TIME_PASSWORD_CHANNEL
    return @MIGRATE_ONE_TIME_PASSWORD_CHANNEL_URI
    elsif service == @TIME_SYNC
    return @TIME_SYNC_URI
    elsif service == @GET_END_USER_DATA
    return @GET_END_USER_DATA_URI
    elsif service == @PUT_END_USER_DATA
    return @PUT_END_USER_DATA_URI
    else
      return nil
    end
  end
end