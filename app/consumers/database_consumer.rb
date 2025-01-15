class DatabaseConsumer < ApplicationConsumer
  def consume
    messages.each do |message|
      Rails.logger.info("DatabaseConsumer:: Received message: #{message}")
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
