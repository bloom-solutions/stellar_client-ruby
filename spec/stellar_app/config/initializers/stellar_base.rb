StellarBase.configure do |c|
  c.modules = %i(bridge_callbacks withdraw)

  c.distribution_account = "G-DISTRIBUTION"

  c.on_bridge_callback = StellarBase::WithdrawalRequests::Process
  # c.check_bridge_callbacks_authenticity = false
  # c.check_bridge_callbacks_mac_payload = false
  # c.bridge_callbacks_mac_key = ENV["MAC_KEY"]

  # c.on_withdraw = ProcessWithdrawal
  c.withdrawable_assets = [
    {
      type: "crypto",
      network: "bitcoin",
      asset_code: "BTCT",
      issuer: "G-ISSUER",
      fee_fixed: 0.001,
    }
  ]
end
