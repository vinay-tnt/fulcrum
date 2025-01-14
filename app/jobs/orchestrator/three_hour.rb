module Orchestrator
  class ThreeHour < Base
    def perform
      Rails.logger.info "ThreeHour job is running"
    end
  end
end
