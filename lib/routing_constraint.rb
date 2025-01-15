module RoutingConstraint
  AUTHORIZATION_HEADER = "Authorization".freeze
  DELL_TENANTS = [ "dell", "dell-demo" ].freeze

  class << self
    def matches?(request)
      true
    end

    def dell_engine?(request)
      return true if DELL_TENANTS.include?(request.subdomain)

      api_key = extract_api_key(request)
      return false if api_key.blank?

      tenant = find_tenant(api_key)
      DELL_TENANTS.include?(tenant&.subdomain)
    end

    private

    def extract_api_key(request)
      auth_header = request.headers[AUTHORIZATION_HEADER]
      return nil if auth_header.blank?

      auth_header
    end

    def find_tenant(api_key)
      @api_key_cache ||= {}
      @api_key_cache[api_key] ||= ApiKey.preload(:tenant).find_by(api_key: api_key)&.tenant
    end
  end
end
