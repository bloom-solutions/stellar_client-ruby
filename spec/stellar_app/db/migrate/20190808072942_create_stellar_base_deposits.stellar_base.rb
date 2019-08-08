# This migration comes from stellar_base (originally 20181001070647)
class CreateStellarBaseDeposits < ActiveRecord::Migration[5.2]

  def change
    create_table :stellar_base_deposits do |t|
      t.integer :deposit_request_id, index: true
      t.string :tx_id, index: true
      t.decimal :amount
      t.string :stellar_tx_id

      t.timestamps
    end

    add_foreign_key(:stellar_base_deposits, :stellar_base_deposit_requests, {
      column: :deposit_request_id,
    })
  end

end
