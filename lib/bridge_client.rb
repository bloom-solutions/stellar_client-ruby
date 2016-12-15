require "active_support/core_ext/hash/indifferent_access"
require "api_client_base"
require "gem_config"
require "virtus"
require "bridge_client/version"
require "bridge_client/client"
require "bridge_client/coercers/indifferent_hash"
require "bridge_client/requests/base_request"
require "bridge_client/requests/send_payment_request"
require "bridge_client/responses/base_response"
require "bridge_client/responses/send_payment_response"

module BridgeClient

  include GemConfig::Base

  with_configuration do
    has :host, classes: String
  end

  def self.new(options={})
    Client.new(
      host: options[:host] || BridgeClient.configuration.host,
    )
  end

end
