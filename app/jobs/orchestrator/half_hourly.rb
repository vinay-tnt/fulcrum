module Orchestrator
  class HalfHourly < Base
    def perform
      Rails.logger.info "HalfHourly job is running"
    end
  end
end
