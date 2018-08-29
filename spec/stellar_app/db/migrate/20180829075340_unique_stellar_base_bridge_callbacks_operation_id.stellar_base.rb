# This migration comes from stellar_base (originally 20180816135847)
class UniqueStellarBaseBridgeCallbacksOperationId < ActiveRecord::Migration[5.1]
  def up
    remove_index :stellar_base_bridge_callbacks, :operation_id
    add_index :stellar_base_bridge_callbacks, :operation_id, unique: true
  end

  def down
    remove_index :stellar_base_bridge_callbacks, :operation_id
    add_index :stellar_base_bridge_callbacks, :operation_id
  end
end
