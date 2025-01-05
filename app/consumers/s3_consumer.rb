class S3Consumer < ApplicationConsumer
  def consume
    messages.each do |message|
      s3 = Aws::S3::Client.new
      bucket_name = ENV.fetch('RP_SENSOR_DATA_S3', nil)

      parsed_message = JSON.parse(message.raw_payload).to_h.deep_symbolize_keys
      device = parsed_message[:device_identifier]

      Rails.logger.info "#{parsed_message[:unique_reading_id]} - #{parsed_message[:device_identifier]} - Processing S3 insertion for device: #{device}"

      timestamp = Time.at(parsed_message[:timestamp] / 1000).utc.to_datetime.strftime('%Y-%m-%d')
      file_name = "#{device}/#{timestamp}/#{parsed_message[:timestamp]}.json"

      s3.put_object(
        body: JSON.generate(parsed_message),
        bucket: bucket_name,
        key: file_name
      )
    end
  end

  # Run anything upon partition being revoked
  def revoked
    Rails.logger.info("#{self.class} partition is being revoked!")
  end

  # Define here any teardown things you want when Karafka server stops
  def shutdown
    Rails.logger.info("#{self.class} detected shutdown operation of Karafka server!")
  end
end
