# This migration comes from stellar_base (originally 20181210043919)
class AddUniqueIndexToDeposits < ActiveRecord::Migration[5.2]

  def up
    add_index :stellar_base_deposits, %i[deposit_request_id tx_id], unique: true
  end

  def down
    add_index :stellar_base_deposits, column: %i[deposit_request_id tx_id]
  end

end
