module StellarClient
  class GetTomlRequest

    include APIClientBase::Request.module

    def path
      "/.well-known/stellar.toml"
    end

  end
end
