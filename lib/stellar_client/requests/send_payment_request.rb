module StellarClient
  class SendPaymentRequest

    include APIClientBase::Request.module(default_opts: :default_opts)

    BODY_ATTRS = %i[
      source
      destination
      amount
      asset_code
      asset_issuer
      memo_type
      memo
    ]
    attribute :source, String
    attribute :destination, String
    attribute :amount, Float
    attribute :asset_code, String
    attribute :asset_issuer, String
    attribute :memo_type, String
    attribute :memo, String
    attribute :body, Hash, lazy: true, default: :default_body
    attribute :bridge_host, String

    private

    def path
      "/payment"
    end

    def headers
      {"Content-Type" => "application/x-www-form-urlencoded"}
    end

    def default_action
      :post
    end

    def default_body
      BODY_ATTRS.each_with_object({}) do |attr, hash|
        hash[attr] = send(attr)
      end
    end

    def default_uri
      uri = Addressable::URI.parse(bridge_host)
      uri.path = api_client_base_path
      uri.to_s
    end

    def default_opts
      { bridge_host: bridge_host }
    end

  end
end
