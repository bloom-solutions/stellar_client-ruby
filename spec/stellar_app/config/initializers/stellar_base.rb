StellarBase.configure do |c|
  c.modules = %i(bridge_callbacks withdraw deposit)

  c.distribution_account = "G-DISTRIBUTION"

  c.on_bridge_callback = StellarBase::WithdrawalRequests::Process

  c.withdrawable_assets = [
    {
      type: "crypto",
      network: "bitcoin",
      asset_code: "BTCT",
      issuer: "G-ISSUER",
      fee_fixed: 0.001,
      max_amount_from: GetMaxAmount.to_s,
    }
  ]

  c.depositable_assets = [
    {
      type: "crypto",
      network: "bitcoin",
      asset_code: "BTCT",
      issuer: "G-ISSUER",
      fee_fixed: 0.00001,
      max_amount_from: GetMaxAmount.to_s,
      how_from: GetHow.to_s,
    }
  ]
end
