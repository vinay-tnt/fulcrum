module V1
  class PhoneConsumer < ApplicationConsumer
    def consume
      messages.each do |message|
        log_info("AOVX Consumer:: Received message: #{message}")
      end
    end

    # Run anything upon partition being revoked
    def revoked
      log_info("#{self.class} partition is being revoked!")
    end

    # Define here any teardown things you want when Karafka server stops
    def shutdown
      log_info("#{self.class} detected shutdown operation of Karafka server!")
    end
  end
end
