module DeviceCache
  module_function

  def client
    url = "#{ENV.fetch('RP_DEVICE_REDIS_HOST', nil)}:#{ENV.fetch('RP_DEVICE_REDIS_PORT', nil)}"
    @client ||= Redis.new(url: "redis://#{url}")
  end
end
