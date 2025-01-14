module Orchestrator
  class QuarterHourly < Base
    def perform
      Rails.logger.info "QuarterHourly job is running"
    end
  end
end
