require "gem_config"
require "bridge_client/version"

module BridgeClient

  include GemConfig::Base

  with_configuration do
    has :host, classes: String
  end

end
