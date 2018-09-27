# This migration comes from stellar_base (originally 20180925045927)
class CreateStellarBaseDepositRequests < ActiveRecord::Migration[5.2]

  def change
    create_table :stellar_base_deposit_requests do |t|
      t.string :asset_type, null: false
      t.string :asset_code, null: false
      t.string :memo_type
      t.string :memo
      t.string :account_id, null: false
      t.string :issuer, null: false
      t.string :email_address
      t.string :deposit_address, null: false
      t.string :deposit_type
      t.integer :eta
      t.decimal :min_amount, null: false, default: 0.0
      t.decimal :max_amount
      t.decimal :fee_fixed, null: false, default: 0.0
      t.decimal :fee_percent, null: false, default: 0.0
      t.string :extra_info

      t.timestamps
      t.index(%i[asset_type asset_code], {
        name: :index_stellar_base_deposit_requests_on_asset,
      })
    end
  end

end
