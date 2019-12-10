class AddCollectedMoneyToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :collected_money, :string, default: "0"
  end
end
