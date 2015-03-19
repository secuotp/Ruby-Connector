require_relative "XMLRequest.rb"
require_relative "SecuOTPServices.rb"
require_relative "ServiceStatus.rb"
require_relative "ServiceCode.rb"

service = SecuOTPService.new
service.SecuOTPService("polwath.com", "5BT9V-H7T77-TZ6UP-KQHQV")
status = service.authenticateOneTimePassword("polwath", "123456")
if(status.getStatusId == "100")
   puts "Good"
else
   puts status.getStatusText
end