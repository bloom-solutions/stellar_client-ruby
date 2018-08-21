module StellarClient
  class BaseRequest

    include APIClientBase::Request.module(default_opts: :default_opts)
    attribute :bridge_host, String

    private

    def default_opts
      { bridge_host: bridge_host }
    end

  end
end
