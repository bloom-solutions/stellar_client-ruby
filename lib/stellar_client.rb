require "active_support/core_ext/hash/indifferent_access"
require "addressable"
require "api_client_base"
require "gem_config"
require "tomlrb"
require "virtus"
require "stellar_client/version"

module StellarClient

  include APIClientBase::Base

  with_configuration do
    has :host, classes: String
    has :bridge_host, classes: String
  end

end

require "stellar_client/client"
require "stellar_client/coercers/indifferent_hash"
require "stellar_client/requests/deposit_request"
require "stellar_client/requests/get_fees_request"
require "stellar_client/requests/get_toml_request"
require "stellar_client/requests/send_payment_request"
require "stellar_client/requests/withdraw_request"
require "stellar_client/responses/base_response"
require "stellar_client/responses/deposit_response"
require "stellar_client/responses/get_fees_response"
require "stellar_client/responses/get_toml_response"
require "stellar_client/responses/send_payment_response"
require "stellar_client/responses/withdraw_response"
