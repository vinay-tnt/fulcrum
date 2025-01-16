class ApplicationConsumer < Karafka::BaseConsumer

  private

  # Private: Log an info message with the device identifier and log identifier.
  #
  # log_identifier    - The String log identifier (UUIDv4 format) (optional).
  # device_identifier - The String device identifier (optional).
  # message           - The String message to log.
  #
  # Examples
  #
  #   log_info("device123", "log456", "This is a log message")
  #   log_info("This is a simple log message")
  #
  # Returns nothing.
  def log_info(message, log_identifier = nil, device_identifier = nil)
    log_message = build_log_message(message, log_identifier, device_identifier)
    Rails.logger.info(log_message)
  end

  # Private: Log an error message with the device identifier and log identifier.
  #
  # log_identifier    - The String log identifier (UUIDv4 format) (optional).
  # device_identifier - The String device identifier (optional).
  # message           - The String message to log.
  #
  # Examples
  #
  #   log_error("device123", "log456", "This is a log message")
  #   log_error("This is a simple log message")
  #
  # Returns nothing.
  def log_error(message, log_identifier = nil, device_identifier = nil)
    log_message = build_log_message(message, log_identifier, device_identifier)
    Rails.logger.error(log_message)
  end

  # Private: Log a warning message with the device identifier and log identifier.
  #
  # log_identifier    - The String log identifier (UUIDv4 format) (optional).
  # device_identifier - The String device identifier (optional).
  # message           - The String message to log.
  #
  # Examples
  #
  #   log_warn("device123", "log456", "This is a log message")
  #   log_warn("This is a simple log message")
  #
  # Returns nothing.
  def log_warn(message, log_identifier = nil, device_identifier = nil)
    log_message = build_log_message(message, log_identifier, device_identifier)
    Rails.logger.warn(log_message)
  end

  # Private: Build the log message.
  #
  # message           - The String message to log.
  # log_identifier    - The String log identifier (UUIDv4 format) (optional).
  # device_identifier - The String device identifier (optional).
  #
  # Returns the formatted log message.
  def build_log_message(message, log_identifier, device_identifier)
    parts = [self.class.to_s]
    parts << log_identifier if log_identifier
    parts << device_identifier if device_identifier
    parts << message
    parts.join(" - ")
  end
end
