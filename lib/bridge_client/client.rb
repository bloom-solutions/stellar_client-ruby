module BridgeClient
  class Client

    include APIClientBase::Client.module(default_opts: :default_opts)
    api_action :send_payment

    attribute :host, String

    private

    def default_opts
      { host: host }
    end

  end
end
