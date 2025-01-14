module Orchestrator
  class Base < ApplicationJob
    queue_as :periodic
  end
end
