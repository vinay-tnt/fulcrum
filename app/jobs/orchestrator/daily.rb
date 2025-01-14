module Orchestrator
  class SixHour < Base
    def perform
      Rails.logger.info "Daily job is running"
    end
  end
end
