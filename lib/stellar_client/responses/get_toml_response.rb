module StellarClient
  class GetTomlResponse < BaseResponse

    attribute :toml, Hash, lazy: true, default: :default_toml

    private

    def default_toml
      Tomlrb.parse(raw_response.body)
    end

  end
end
