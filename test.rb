require_relative "XMLRequest.rb"
require_relative "SecuOTPServices.rb"
require_relative "ServiceStatus.rb"
require_relative "ServiceCode.rb"
require_relative "OTPMigration.rb"


service = SecuOTPService.new
service.SecuOTPService("polwath.com", "5BT9V-H7T77-TZ6UP-KQHQV")

status = service.migrateOTP("polwath")

if status.getStatusId.value === '101'
  puts true
  puts status.getStatusId.value
  puts status.getStatusText.value
else status.getStatusId.value === '100'
  puts status.getStatusId.value
  puts status.getStatusText.value
end
