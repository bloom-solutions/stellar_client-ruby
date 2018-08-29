module StellarClient
  class Client

    include APIClientBase::Client.module(default_opts: :default_opts)
    api_action :send_payment
    api_action :get_toml

    attribute :bridge_host, String

    private

    def default_opts
      { host: host, bridge_host: bridge_host }
    end

  end
end
