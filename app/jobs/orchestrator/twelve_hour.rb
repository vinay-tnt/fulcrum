module Orchestrator
  class TwelveHour < Base
    def perform
      Rails.logger.info "TwelveHour job is running"
    end
  end
end
