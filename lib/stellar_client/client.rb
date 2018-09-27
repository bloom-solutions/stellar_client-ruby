module StellarClient
  class Client

    include APIClientBase::Client.module(default_opts: :default_opts)
    api_action :send_payment
    api_action :get_toml

    def withdraw(opts = {})
      transfer_host = get_toml.toml["TRANSFER_SERVER"]
      request = WithdrawRequest.new(opts.merge(host: transfer_host))
      raw_response = request.()
      WithdrawResponse.new(raw_response: raw_response)
    end

    def deposit(opts = {})
      transfer_host = get_toml.toml["TRANSFER_SERVER"]
      request = DepositRequest.new(opts.merge(host: transfer_host))
      raw_response = request.()
      DepositResponse.new(raw_response: raw_response)
    end

    attribute :bridge_host, String

    private

    def default_opts
      { host: host, bridge_host: bridge_host }
    end

  end
end
