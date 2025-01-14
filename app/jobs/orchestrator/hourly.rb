module Orchestrator
  class Hourly < Base
    def perform
      Rails.logger.info "Hourly job is running"
    end
  end
end
