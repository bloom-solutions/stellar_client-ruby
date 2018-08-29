# This migration comes from stellar_base (originally 20180816014433)
class CreateStellarBaseBridgeCallbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :stellar_base_bridge_callbacks do |t|
      t.string :operation_id, null: false
      t.string :from, null: false
      t.string :route
      t.decimal :amount, null: false
      t.string :asset_code
      t.string :asset_issuer
      t.string :memo_type
      t.string :memo
      t.string :data
      t.string :transaction_id
      t.index %i[asset_code asset_issuer], name: :index_stellar_base_bridge_callbacks_on_asset
      t.index :memo
      t.index :operation_id
      t.index :transaction_id
      t.timestamps
    end
  end
end
