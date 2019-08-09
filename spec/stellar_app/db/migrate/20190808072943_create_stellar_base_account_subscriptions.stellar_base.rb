# This migration comes from stellar_base (originally 20181003072138)
class CreateStellarBaseAccountSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :stellar_base_account_subscriptions do |t|
      t.string :address, null: false
      t.string :cursor
      t.index :address, unique: true
      t.timestamps
    end
  end
end
