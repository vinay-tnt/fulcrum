module Orchestrator
  class SixHour < Base
    def perform
      Rails.logger.info "SixHour job is running"
    end
  end
end
