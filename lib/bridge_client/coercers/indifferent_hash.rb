module BridgeClient
  module Coercers
    class IndifferentHash < Virtus::Attribute

      def coerce(value)
        value.is_a?(::Hash) ? value.with_indifferent_access : value
      end

    end
  end
end
