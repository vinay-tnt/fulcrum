module Iot
  module_function

  # Create singleton methods for AWS IoT Core and IoT Data Place. Memoize the clients
  # so that they are only created once and reused for subsequent calls.
  def core_client
    @core_client ||= Aws::IoT::Client.new
  end

  def data_plane_client
    @data_plane_client || Aws::IoTDataPlane::Client.new(
      region: ENV.fetch("RP_IOT_CORE_REGION", nil),
      endpoint: ENV.fetch("RP_IOT_CORE_ENDPOINT", nil)
    )
  end
end
