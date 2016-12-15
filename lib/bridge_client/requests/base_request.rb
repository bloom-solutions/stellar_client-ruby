module BridgeClient
  class BaseRequest

    include APIClientBase::Request.module(default_opts: :default_opts)

    private

    def default_opts
      { host: host }
    end

  end
end
