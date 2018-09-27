module StellarClient
  class DepositResponse < BaseResponse

    BODY_ATTRS = %i[
      how
      eta
      min_amount
      max_amount
      fee_fixed
      fee_percent
      extra_info
    ].freeze

    attribute(:body, Coercers::IndifferentHash, {
      lazy: true,
      default: :default_body,
    })
    attribute :how, String, lazy: true, default: :default_how
    attribute :eta, String, lazy: true, default: :default_eta
    attribute :min_amount, BigDecimal, lazy: true, default: :default_min_amount
    attribute :max_amount, BigDecimal, lazy: true, default: :default_max_amount
    attribute :fee_fixed, BigDecimal, lazy: true, default: :default_fee_fixed
    attribute(:fee_percent, BigDecimal, {
      lazy: true,
      default: :default_fee_percent,
    })
    attribute(:extra_info, Hash, {
      lazy: true,
      default: :default_extra_info,
    })

    private

    def default_body
      JSON.parse(raw_response.body)
    end

    BODY_ATTRS.each do |attr|
      define_method("default_#{attr}".to_sym) do
        body[attr]
      end
    end

  end
end
