module Orchestrator
  class Weekly < Base
    def perform
      Rails.logger.info "Weekly job is running"
    end
  end
end
