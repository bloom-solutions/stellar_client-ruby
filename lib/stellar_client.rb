require "active_support/core_ext/hash/indifferent_access"
require "addressable"
require "api_client_base"
require "gem_config"
require "virtus"
require "stellar_client/version"
require "stellar_client/client"
require "stellar_client/coercers/indifferent_hash"
require "stellar_client/requests/base_request"
require "stellar_client/requests/send_payment_request"
require "stellar_client/responses/base_response"
require "stellar_client/responses/send_payment_response"

module StellarClient

  include GemConfig::Base

  with_configuration do
    has :bridge_host, classes: String
  end

  def self.new(options={})
    bridge_host = options[:bridge_host] ||
      StellarClient.configuration.bridge_host

    Client.new(
      bridge_host: bridge_host,
    )
  end

end
