module V1
  class AovxConsumer < ApplicationConsumer
    def consume
      messages.each do |message|
        begin
          parsed_message = JSON.parse(message.raw_payload)
          payload = AovxPayload.new(parsed_message)
          log_identifier = SecureRandom.uuid

          log_info("Received message from device at: #{payload.iot_core_received_at}", log_identifier, payload.device_identifier)
          log_info("Payload: #{JSON.generate(message.raw_payload)}", log_identifier, payload.device_identifier)

          parsed_reading = RelativityParsers::V3::Aovx.process_payload(payload.data)

          pp parsed_reading
        rescue => e
          log_error("Failed to parse AOVX reading", log_identifier)
          log_error(e.message, log_identifier)
        end
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
