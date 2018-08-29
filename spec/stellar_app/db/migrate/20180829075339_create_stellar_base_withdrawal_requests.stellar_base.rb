# This migration comes from stellar_base (originally 20180816110314)
class CreateStellarBaseWithdrawalRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :stellar_base_withdrawal_requests do |t|
      t.string :asset_type, null: false
      t.string :asset_code, null: false
      t.string :dest, null: false
      t.string :issuer, null: false
      t.string :dest_extra
      t.string :account_id
      t.string :memo_type
      t.string :memo
      t.integer :eta
      t.decimal :min_amount, null: false, default: 0.0
      t.decimal :max_amount
      t.decimal :fee_fixed, null: false, default: 0.0
      t.decimal :fee_percent, null: false, default: 0.0
      t.decimal :fee_network, null: false, default: 0.0
      t.string :extra_info
      t.index([:asset_type, :asset_code], {
        name: :index_stellar_base_withdrawal_requests_on_asset,
      })
      t.timestamps
    end
  end
end
