module StellarClient
  class WithdrawResponse < BaseResponse

    BODY_ATTRS = %i[
      account_id
      memo_type
      memo
      min_amount
      fee_fixed
      fee_percent
      fee_network
    ].freeze
    attribute(:body, Coercers::IndifferentHash, {
      lazy: true,
      default: :default_body,
    })
    attribute :account_id, String, lazy: true, default: :default_account_id
    attribute :memo_type, String, lazy: true, default: :default_memo_type
    attribute :memo, String, lazy: true, default: :default_memo
    attribute :min_amount, BigDecimal, lazy: true, default: :default_min_amount
    attribute :fee_fixed, BigDecimal, lazy: true, default: :default_fee_fixed
    attribute(:fee_percent, BigDecimal, {
      lazy: true,
      default: :default_fee_percent,
    })
    attribute(:fee_network, BigDecimal, {
      lazy: true,
      default: :default_fee_network,
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
