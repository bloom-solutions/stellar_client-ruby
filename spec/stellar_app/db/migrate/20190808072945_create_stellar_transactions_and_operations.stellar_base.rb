# This migration comes from stellar_base (originally 20181217090323)
class CreateStellarTransactionsAndOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :stellar_base_stellar_operations do |t|
      t.string :operation_id, null: false
      t.string :transaction_hash, null: false
      t.string :type
      t.text :data
      t.index :operation_id, unique: true
      t.timestamps
    end

    create_table :stellar_base_stellar_transactions do |t|
      t.string :transaction_id, null: false
      t.string :memo
      t.string :memo_type
      t.index :memo
      t.index :transaction_id, unique: true
      t.timestamps
    end
  end
end
