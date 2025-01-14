require "resque"
require "resque-scheduler"

Resque.redis = "#{ENV.fetch('RP_APP_REDIS_HOST', nil)}:#{ENV.fetch('RP_APP_REDIS_PORT', nil)}"
Resque.redis.namespace = "resque:#{Rails.env}"

Resque.schedule = YAML.load_file(Rails.root.join("config/schedule.yml"))
Resque::Scheduler.dynamic = true

# Configure Logger to log both to file and STDOUT
stdout_logger = Logger.new(STDOUT) # Logger for console
file_logger = Logger.new(Rails.root.join("log", "#{Rails.env}_resque.log")) # Logger for file

# Create a BroadcastLogger that writes to both STDOUT and the file
broadcast_logger = ActiveSupport::BroadcastLogger.new(stdout_logger)
broadcast_logger.broadcast_to(file_logger)

# Assign the BroadcastLogger to Resque
Resque.logger = broadcast_logger
