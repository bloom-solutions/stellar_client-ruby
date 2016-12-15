module BridgeClient
  class Client

    include Virtus.model
    attribute :host, String

    include APIClientBase::Client.module(default_opts: :default_opts)
    api_action :send_payment

    private

    def default_opts
      { host: host }
    end

  end
end
