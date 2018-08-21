module StellarClient
  class Client

    include APIClientBase::Client.module(default_opts: :default_opts)
    api_action :send_payment

    attribute :bridge_host, String

    private

    def default_opts
      { bridge_host: bridge_host }
    end

  end
end
